enum ScreenSize {
  compact,
  medium,
  expanded,
  large,
  xLarge,
}

enum NetworkMethod {
  get,
  post,
  put,
  patch,
  delete,
  none,
}

enum StatusType {
  information,
  sucess,
  redirect,
  clientError,
  serverError,
}

enum StatusCode {
  continue_(100),
  switchProtocols(101),
  processing(102),
  earlyHints(103),

  ok(200),
  created(201),
  accepted(202),
  nonAuthoritativeInformation(203),
  noContent(204),
  resetContent(205),
  partialContent(206),
  multiStatus(207),
  alreadyReported(208),
  iMUsed(226),

  multipleChoices(300),
  movedPermanently(301),
  found(302),
  seeOther(303),
  notModified(304),
  temporaryRedirect(307),
  permanentRedirect(308),

  badRequest(400),
  unauthorized(401),
  paymentRequired(402),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  notAcceptable(406),
  proxyAuthenticationRequired(407),
  requestTimeout(408),
  conflict(409),
  gone(410),
  lenghtRequired(411),
  preconditionFailed(412),
  payloadTooLarge(413),
  uriTooLong(414),
  unsupportedMediaType(415),
  rangeNotStisfiable(416),
  expectationFailed(417),
  imATeapot(418),
  misdirectedRequest(421),
  unprocessableContent(422),
  locked(423),
  failedDependency(424),
  tooEarly(425),
  upgradeRequired(426),
  preconditionRequired(428),
  tooManyRequests(429),
  requestHeaderFieldsTooLarge(431),
  unavailableForLeagalReasons(451),

  internalServerError(500),
  notImplemented(501),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504),
  httpVersionNotSupported(505),
  variantAlsoNegotiates(506),
  insufficientStorage(507),
  loopDetected(508),
  notExtended(510),
  networkAuthenticationRequired(511),

  none(-1);

  const StatusCode(this.value)
      : assert(
          (value >= 100 && value < 600) || value == -1,
          "Statuscode's value must be between 100 and 599",
        ),
        type = value < 200
            ? StatusType.information
            : value < 300
                ? StatusType.sucess
                : value < 400
                    ? StatusType.redirect
                    : value < 500
                        ? StatusType.clientError
                        : StatusType.serverError;

  final int value;
  final StatusType type;

  static StatusCode fromInt(int i) => StatusCode.values.singleWhere(
        (element) => element.value == i,
        orElse: () => StatusCode.none,
      );
}

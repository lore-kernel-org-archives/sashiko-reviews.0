Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540976;
	b=HLiJ9lfaSRW9pxW7/ihF2jFZRSWi/Pj3tWPCMRonR8t3CBuvwsGCdxbw7epIWJCEhFPN
	 2Aj9EfTyEfPGMeZ8t+4zZBvNoFSXx8O6QWiy5ygJhy0Y97nyWuOkJEyrZde9jXZz6cYUD
	 +H9bFFt74vKDpnBau7COo8CXbwOtrWnD2BEQjgZM/kTBNIGJJw7Autv05NM5AtIiZbEx5
	 ufIdnRo1xXTL6dWmxoDGuVdKT4km1PYPY4ACnWHO7fvpZxf/SaI4JEC+FpeI4X6dCe7lI
	 AIAi4boqawbuTMmfwRnGA1hchwcm02DHYLQ3uZGV1vLtam4ZFQVu9Vuh14DCSWKoKBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:In-Reply-To:References:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=K7ZWozzEANVXf1lex+kBD8Vnsv+SJSezh9UZ3MXZI24=;
	b=INzRFNjNN92nbnGMHzBvDbHwxdFYoXjAWMqvbV9XwDDfb0hHvHKLrlrs8RhU2bAabWTy
	 HD6/br2AXAr83D/MI5zcD3tUgg3RCAQhweGm8P8Tsu15laGcfh6TDQfTf3OChi6NUxiXR
	 0HwwhOtCDCdIv9r+MJyMXsGt084nKyj2F28by0wSvw0IXA28dqUwrAss7uTO/9oy8wuk5
	 0MvXMUV4HQEc20uC6FgBz80eEVtqogzqQ6FDg87e/oYmDL8NI8ZbazchQZaLugU2Q9dxT
	 p+KOaDmG3vqW5mam53xPo7+FjH+RXThICrrFsRzUcxpFpLLpugUbWqE5K2wdDRSe0Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSLzBO1W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C3606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSLzBO1W
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so37397a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540974; cv=none;
        d=google.com; s=arc-20260327;
        b=WZvT9FwtDxBE/9zzL4bJ/SqEfwL1lavywHiwEqJpZM2pl3OpPcN6QH4KZjK2IF8gbY
         CPUOM+J2YUB3jerAzF+HcANGV+kY0Yq0heDCGei1ey4cE588iH2K1KYefJJ5NW7bL2eG
         UeIbWVrFUgvu+iqN1U2GFD3/hXOB/cHiI6eXo8ge1dX4YWlUwbff+CyZNl/cWjX9gkGE
         axbY3dtHz3mhEF+/whpjjeXb7kY6bJvK96zwUnwIvc5vCRPC9RWmK7atjLHiOW8zD58T
         hP0j6aUD/F8z2+eKFAseWxxL/wya39NFCZVYVajDP/Dp3UcGwwzERl33CIxtA/h6Ho+u
         UfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=K7ZWozzEANVXf1lex+kBD8Vnsv+SJSezh9UZ3MXZI24=;
        fh=QYu5wfvzY4bVNZYmP/SSCaHDjvNjBOVFh5unOcQUsbI=;
        b=WHGG7DrX9j8JMSda6wazONOIrbqfSeyxLBR2T6EkTpfun/xN8VCJnSurOnpj/SkWAW
         Ka4jtUTrvKjnnIOMXYPUoNyXCgUK4z0A8dTrSXqoJ517VGdK6Q4Pth78h11jc33A2sM4
         W82MsLLecvG2TAVgHo6Itq6kfmA1Q+E/mlcqNli7Cwah1V0mvoDs72dJgCddwgVFS+4K
         M/2i0s9tKnt6vWCQ/Rgh/ZpaazumKUmE1ijdIHpoEAJoK08XqAtKsNelUeBT8LChkmah
         +4LkEqmRZIGZef0uFcpWUVN3SjMBVusoS1iNjf24jn5FJi4s3txom2n46KXS+zA+QKEb
         qhRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795540974; x=1796145774; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7ZWozzEANVXf1lex+kBD8Vnsv+SJSezh9UZ3MXZI24=;
        b=kSLzBO1WrkriNuVX+bdLxQz4H7O3E+djWmN89B0uHwapF8exhHNBlLlW6RWW/mqLWg
         KjeevgETDhAKgbwnACuP6SLsEINE9T77CchWQiJKMBA7m2sFhgaAQfXDZkxlKSgrnWrI
         IpnsWsH9oqpQJta7JcS63qfAgIUwXKxCoeSz0PDg6I3bjkm8hy/iqTQeaR4zYj2tzfU5
         Lay7VnY9zqViMDsOkF9a1kKfBIab6o4E44j1UpLhdoAxC4ZiqRJtDtH2zK7PSVEWL5J8
         GzGJgT3DbJ8iaAk6p/OqtO+TJNKTqCA3KN76STYU1PnytTmdSCVd4Ga1UxD76Axum1if
         069g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540974; x=1796145774;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K7ZWozzEANVXf1lex+kBD8Vnsv+SJSezh9UZ3MXZI24=;
        b=1osmQkl0m1oHnUZ75w11kIk4TcLfVinNWTnS197kw5KSIBb2vrBu/NhPzc6OXrUEpr
         PN4/EKlPJ7LjAwhNDjzi9dTVthJXoYot5ErOcLAaKEEs4fVfxk6MpNrTWUQnjmOk040j
         h5/kHdi0J2/TOvjGH2coTkmA98opyV+hwGdMH2qxA5jltUXIHZWy9i4z/FXT/zST0Dg5
         x/zOxN7yVZIA8rOc99IkCfKMfvCgSvGQl51aGL04ZdfYwmavvHZHW6EztxmlPvgTCnr1
         uPIjp/LcxGrvX9o3whM0xpGryCh+fK9HEiZ+0OtKij0Y+jx57Tcwzps5SsJR/RJs3qfJ
         I6Jg==
X-Gm-Message-State: APuU4Z8rezOrBEH1QIMLydbwWvnl41zvji2ZaPQsBViEvM84+vxOZ1Cg
	hhecj4MdZ8C5BR/QnNM0GDr3QDWi4QTLcNRln0Clg4/d+427uAEGIlurj/cpcK5ujD3nQTQ0nFO
	Gr7OpoLetMaRRVt8VljLVlcwOgp7/sfML7BxVLnJqRcL0Uuw6gcNiP7lT
X-Gm-Gg: AZFdTZffCbkGtkrXGNKD62GyagRhy+LlqsdcJY9XSvuSDEABKFPH1HXe5A4k/DGqyaI
	B7KVJ0Dq8NpxWTWQ0bQpnGPlcMv/4aAAxWqyHrWe1EjCLatQEAy7IrPwmHV4aG4vqTfT5ZssOQW
	o9LrMPwXCrJ08WD+aPhlOlfS/+qe+lGRqmkKErhdlAsVTvCTc/qe0ilSccUByeKSCEI98ByUCJw
	whV8aS/kZBjjYt17gfyOHGIplAvTYqPyM1mkFJD3X28IkLAbY9DFPr8uoI9rYqZv+YiGcwPHrUK
	1keDILwwRuMTrQ8OxKBmasAffCnfKbPly6sgmQBiF136BI951r7B4W2PwGHhbmgCGpzO9/8j2LM
	7wVrCwlOBTBFuCUQImfsihcC90llnTGpvjClS1PJdVWezbuxGBJxtiqoUJtrJc7czhQ==
X-Received: by 2002:aa7:cc0a:0:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6ba6ed9f615mr252227a12.12.1795540974220; Tue, 24 Nov 2026
 09:22:54 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 18:22:53 +0100
In-Reply-To: <sashiko-outbox-230556@kernel.org>
References: <20261124051041.3099796-1-zhenwenliang@google.com>
 <20261124051041.3099796-3-zhenwenliang@google.com> <sashiko-outbox-230556@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Zhenwen Liang <zhenwenliang@google.com>
Date: Tue, 24 Nov 2026 18:22:53 +0100
X-Gm-Features: Aa3M54rLrUBIj52P8s98UQtD37Z_eQtms3zPPid3__51D04UW6VlC8D1vg3Uf6Y
Message-ID: <CAE3ZW7vzLOsdcPbBePm1rao3DLpuU6JFNn3ALyPBiyDb2gHYMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvme-tcp: set up R2T data transfer in the send path
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Thanks, the review is correct. Going through the six points:

Introduced by v2:
- [1] CMD_SENT is set after the command PDU send, when a read or a
  command without data may already have been completed and the tag
  reused. This can happen with a compliant controller.
- [4] Relaxing the receive-path offset check to "<" lets an R2T with a
  larger offset through, so a following CQE can complete the request
  while it is still on req_list.
- [6] The new send error path leaves the request on req_list with the
  R2T still pending, so it can be sent again and then failed before
  error recovery stops the queue.

Already in v7.4-rc4 (misbehaving controller only):
- [2] an R2T between nvme_start_request() and llist_add() in queue_rq,
  and an R2T for a write with inline data;
- [3] a duplicate of the final R2T is accepted again, because the final
  send does not advance data_sent.
[5], and the part of [2] about an R2T arriving while the command PDU is
still being sent, are also misbehaving-controller cases; v2 changes
their shape but does not make them reachable for a compliant
controller.

I think deferring the R2T setup to the send path was the wrong
direction: it adds per-request state across completion and reuse, and
each round has found new races. Please disregard patch 2/2.
Patch 1/2 (32-bit overflow in the R2T length check) is independent.

The original problem is narrow. With a compliant controller, after
sock_sendmsg() of the last bytes of a non-final R2T, the receive path
can handle the next R2T before nvme_tcp_advance_req() runs. It then
reads a stale data_sent (rejected since 347d50d92e25) and resets
pdu_sent, which the send path advances afterwards (a short H2CData PDU
on stable). We can reproduce both in QEMU with a target that sends one
R2T per 16 KiB.

A smaller fix that leaves request lifetime alone could be: track the
end offset of the R2Ts accepted so far in a field that only the receive
path uses, and check the R2T against that instead of data_sent; and in
the send path, not advance pdu_sent on the send that completes the
H2CData PDU. That keeps today's receive-path setup and error handling.

Thank you again.

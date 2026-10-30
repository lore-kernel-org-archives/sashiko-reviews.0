Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371758;
	b=vL5oR7YEK26gh1kDf+64Bfkml3acwYyFwMZO+KQojyxw1NbKSCGfZbPvx1lJ/mF+zmlS
	 5xjmr4KImOcchUOoW12OKbC1Q8wx+HY3APU8lsHCuhin/6qgpjgl6+snBIzxNkYUjEUxT
	 SMuZ4VHVk0ZPPWMleTR8xfn91bs8NHPG/UFTNvMfDL+LJ4Dm6MLMdhauuMvD2h3HLh3nH
	 CzGgYJRN5XBrLF9AewzoACoxtd6GJgGQcSWwnQruhU1hxvEGNJXe6varL3bPixLF7CcGj
	 QIc21Wlg1EP5oNEEPrk7nQ2NWZh0kUif+cXmwgxDj3AmPYnlyls8ssam8IBzejwuV1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
	b=lZo6ZvYpZ2gUNwjIBPMVP2FcDyrkKsdUaA7MMwVmihUILekcY6Awd1sxPWYXR13Tvrp2
	 ygIV8gDHDOlFFC+gFF/D1SXHlkmTO5qzFJTUo1H/Hg7JiJmFaZ2ZL3V7aKL5NzewQ+wQ0
	 ydmPD9mg0AlchzvRuXn/o/06wbBpVPK3YoaykS0bXO0PQYFaa2T9OXulGIOf3x6Qx1WJk
	 7SKeIzYElKaBMtcx8yv3uQLM58GhKsh4yBwoeLQUmIY/6+Nz0AFBqSUD/4nsq52pszldM
	 10k95hWao0NWzkucA0bgNgMWdhzxzzI+TIaPML8nlTf+yxOkuvoJ+ZxXtDf5XHpnRwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcSbL2Pp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC63606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcSbL2Pp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1472651eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371756; x=1793976556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
        b=GcSbL2Ppi+G+H7ywHh4AwfJzhBIahkVi+izhVMHmeJt32H7YB0fa6nIRT/Z8/R3z3u
         tGIg7neXvui4a9u+XVgkc5jH7MdhvyNpLFS8b3TaZEaQ1inCkxQ3F5aObx3ZnQbxpqJf
         YTXl+likPiilEHFZ6Vnl7zm1+dV/gwkOGC8PHUCkY6lbsuFcwehC6vb0MZTLUSAoGZkm
         jbcBzhGHZ+gVd6+D/rY/yRh+9OeUjCOiaGoxMJh3Osaq5AF7g69VTnCLNAEy8o3PU35X
         KFDQkfAnrMGTStpomIbvtmSx/JUyxaZsT5siOUd9MCxGc5SDY2BCVZLm1bfP6gFhmXJn
         X2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371756; x=1793976556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
        b=dgPRjlyr0Lo3KIOPQbpXbcvFlBaJW2Uju33GPABTvsoasUK4ZnxCRi+xYFBtlstjAF
         fOA44sIQ961h7zMnxwnObR72CciDKYFJfzGIzzVYefa7m4HaSNZra2LBbeflsiNq/5Ax
         /Rmcl+K/xWwCLksXYL3stRcupu57bIQnrtY5sWPsokjKnruH2FUfYUNEI2JBIiXIPz2X
         GbLp+fsnlDaCv0dU3vjriNa0jCXn2j1sNxzZ6Ku8htL2u4jQn273SjG0gv9b5eF7xXfz
         fl+lvvzfOaQIGBKwoaBbJ0WzlW0NlblFKsX9vCk9qvE3JoeOybJqwBteJbpJ5rore9Kf
         ES3g==
X-Forwarded-Encrypted: i=1; AKwUvBxzyX56sWslQzQKqvZyJhF1t072aTCzXDdoOLd214nR/2wVw+y11AXXVhhyu8eRYsGi5pcbRHfa/4BS/xcFiv4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJEFAF1TT14G6bYw8t9WJbssE+bg4vGU763pVl9mCOgq+KLdb8C
	q5QvUEWQMQp5j0Yp7FBHRh7+8eir2zGomplRqKj6gXmpyKvuw8DY79Y/
X-Gm-Gg: AYBFou3nzgVUYU5vObeAHCfNixnX5xU9igw+8jHhjO09V/k0nQpx1gGBzNjU3K2bOxy
	+b/oZVO9tlmOMbNbzDPHGge4T8s/mbSbdo4X4VeKpwHFTpYGRgLvXCkO/iADYhCnv5KEjG1rVmC
	yBcNHXx8T/dpY212cm0l2NQY3GdOSAYOjmK3Zhl6RtXf4TBQcAybHF+g+gSBHVpjew6pO5G/pOK
	fToyQ5KIYnUwYrL/hEbPI1g5I3+Tr4QRudOGakX1gPfJ59z90pzz9GA2nM9OPbIsKY3ZBX3s52N
	riuj9AdpLShSnkANMGOSXXkboBVg40YR9JVspQQo9AQn0Ma/MjyRIRwYWIwsrvPTu5OCrI1QHNv
	sJ+FsjjvIsSMInDXulNl9ROvu4TBKXcNN0Z3g4lBABoWvsFLDCP3Y2OZ3za6WrcFwHpjtWIbEnd
	Dcf+tCR/vSFBTjYA9+WU7aT7IfIkHBqUhXrYpteG//rpSKZaEKKL+gtxzV8kTw7BwZU6rHGOAT8
	ez3vrTiNUZ9gnlFs/AXso/LU3HjbjhD5Y+QGj9B0tmpHBn3LFuZcOjO2AGNg47t9PzrQER8lnuh
	SbeLulD3ltF/6nOsomcD3n/zWWuOmlVlvgwwQAta/7119J4uBhc+m0A9S6YAKbVS/wN6k+FHol2
	CqT8/3qNdrbRaIGTiydvS4SrS2Ru8hbgeMIbwZQ==
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr3537014eec.15.1793371756093;
        Fri, 30 Oct 2026 07:49:16 -0700 (PDT)
Received: from m.tailc35649.ts.net ([2401:4900:1c0f:329b:addb:f0d6:4274:b5ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm7975547eec.0.2026.10.30.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:49:14 -0700 (PDT)
From: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable HDMI display
Date: Fri, 30 Oct 2026 20:19:10 +0530
Message-ID: <20261030144910.44353-1-mrigendra.chaubey@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-186080@kernel.org>
References: <sashiko-outbox-186080@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 04:29 UTC, sashiko-bot wrote:
> none of the included .dtsi files (such as k3-am62p-j722s-common-main.dtsi or
> k3-j722s-main.dtsi) define the dss1 node or label yet, because the
> prerequisite AM62P/J722S DSS series noted in the patch commentary is not
> applied in this tree. As a result, referencing &dss1 here causes dtc to fail
> with an unresolved label error during a dtbs build.
>
> Should the prerequisite patch defining the dss1 node be applied before this
> change?

Yes, this is expected. The patch depends on the J722S DSS nodes
(including the dss1 label) from the AM62P display series, as noted
below the "---":

https://lore.kernel.org/all/20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com/

With patches 1-5 and 14 of that series applied, k3-j722s-evm.dtb builds
and passes dtbs_check on next-20261026. I'll resend once that series
is merged, unless the maintainers prefer otherwise.

Thanks,
Mrigendra

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587334;
	b=1k0qpZg2revR73pSqSBuvQYvFobNjmgbM+8IUjW+yj6OsSpAd3QeReG8Mbruf6WQJJe+
	 ZzmM/CXULCpqvRYRj+gO3lJh7IeRtG5jGC9CmhsWxn1V44S2tbyCnvOIzw09D1exwI9IR
	 vtgMl36YEAmURYFpoDkN6DI+pyg+OJdsl/IgyTn7Do0sx8o9txWyMnVcwIDGkfMyKwCNa
	 lxBtokRiY6Kg0DWgMPaWhwNhOO0UnqrDFcyPASrncSxg7gfcximNRhx00/PGlVfl+L0+o
	 JAS5aSK+jspytpPSyliktqFzcccefPKpQ2hZB+jZoUjCBSLj/v7Kr6Z4Lud1QWowTsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
	b=Np2BYX/Q8wAzk0u8H68OGBetEqZb8TYB28RviNSb/S4Bk169+Lm96fKk/IAyyxmvYLMI
	 AvWPtBzNEO+XRl7BM7UU/za0oE52DOof9FqXLEgm2Q2BNpL3s3kOpRkS17vkUFXeT3R1I
	 e1AKwtyWTwqhuHOL4h1yWtlnEue6vT7QBzzkBCBm6hHRDwbslM5KtI0dkbOwgafRVu6jQ
	 rn4R+cb9B84XeUKSnbjtCHAq0I/YKvrxJKFU7bpsQ1ySRQFG42UOSENI4zSQCcP5XVATR
	 RZihJRfebDJnkJ14xhjXX03u8fMsnHO3h7dbE10XFKRAQMJAKQIcpdsnpMMf62ohmVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q8zePUgb;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D14606A329
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 02:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D14606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q8zePUgb
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53665358476so30443651cf.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 18:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793587333; x=1794192133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=q8zePUgbPubU861j24avi63H9bVkDP9cWNIFckFBd4bBLo9PqwK/SS7CbgfoEXOJ7a
         /88t7Oy0r+QYeMRTvSV53AZsNs56RUv4Z6tiPY532Qt7B+89O4Wzs7VulxLlJBBftoIs
         SCDXJVRWKX9sNaqzLPDWgL/4b/m3NeaIuSMzH2PSOVYjasoO/MAlXznXfQlFd9eDRcV1
         WgWdFKzMM/e4UFokBzE5mNYVr4WH1r4M/oFFEHEwUQ1x1/DcZgGyPB9dIcpMCQqp20EU
         fb+3jwCU7UL9QXqYIkHGYn+vG2KnwH0URc1mWUG4Q8NjSAHWrO9ZzOCaNsGSvUKw2NdK
         HpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587333; x=1794192133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=m1R5v24pyCy1dp1kH10TLdGeHUhpcCgP3ybp9zHixvCCrTcp++ATAJmdzzLEb77hgk
         TPBGTAiQEBDVo1T+Zdz+cIXt76MUargEDyliTMxNDbPV2P7NNXZd5TUUSI6UBZV5grLo
         bM4s2N3LHWr+HRVXkl7ETzqK8QtVyQIKqSIH/Vx4dEwqeXHthgx47SATVHV05nv0m5dA
         es8/JWYwPPgrBc9gV/YsVefhs9mH9pUX+eLy+6rWABjCNRn139q7muia28iXS4khJ9/g
         ogjl7Bpwe2sBQvkiXo1WpoWhnNNexFA2rFeJ//RHo71sMBjlO6Nk9IHZUENEUk7KYmKl
         +r2w==
X-Gm-Message-State: AFq9FYKXTYoNNOvQUzLGEbPoXWklAOrcysNDw6cfP+yVyuZmxkQmJqeA
	871f24poQPEhBXPhYQm1YyTKL5IbRwFPgLlZ5r4wf10jn2R9vYWOXaXfWYXSOwnkCw==
X-Gm-Gg: AYBFou2WSkBV9iYH8wcRuQfIWEBqOQRYxwy1GcI8zAHNebrY1ccYFvFHLj5c6T2tku8
	/bQ88Jk3tzjNJZyVufqoeuIRPofP6a2eYOMu08RytyYjNra13buJbhom4Po2stJogWUGPHpmGa/
	vWCdvWcWRO8e3AWGBeZovgySxmUpNbB0Ip2bQhEAOmCPQxVzeW5EC5sgnGgOTrMOm7oYo2DD/jL
	teG21nXdu99H479PXvVdRwVJRkl0jh1uK9FgcqHFGty9UFjm/5nN8nnrd05nudmwrm/vedwm9ii
	Pr2ojzOVdu3j/1EmvS2Ub7B5+4fpdEYDyf4mvtSm8ozxTIUJJGx+NBvMY/DtPhSTqIt31fAkVEl
	Vy9r3+St0qRdFArnPuUeFqIkIc0O1v/GRkhU/LfsskLcpoAP71vBMCPV8JCA+saaz6xNjIEuCre
	10f/iM5Ybm/13l+P5uNCZbSggrGhlUMX/1XRluDx2r/EiFYFyGecwudA1ZPx760QnPab3np2TGU
	Yo5Zi/pXNQAUCQSGtKKGBSosVB3jmXNWRVRpPtmgsFCdxDK4jgG9fyk8rWBFr1Mrd7W8/z3uhmg
	54h80/6wpARtFf6/5RuX9F7Y2vN5
X-Received: by 2002:a05:620a:3916:b0:93f:47fa:b722 with SMTP id af79cd13be357-94421618771mr1465258685a.13.1793587332748;
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm724633685a.27.2026.11.01.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Date: Sun, 1 Nov 2026 21:42:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <b666dc31-1dde-41c3-be0c-3ae5091b9683@rowland.harvard.edu>
References: <20261030151919.3511106-1-jjc@jclark.com>
 <sashiko-outbox-191184@kernel.org>
 <20261031032449.3536559-1-jjc@jclark.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031032449.3536559-1-jjc@jclark.com>

On Sat, Oct 31, 2026 at 10:24:49AM +0700, James Clark wrote:
> On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> > However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> > undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> > usb_unbind_device() does:
> [...]
> > Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> > to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> > usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> > the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> > second time and emit a duplicate USB_DEVICE_ADD notification without an
> > intervening USB_DEVICE_REMOVE?
> 
> Both of Sashiko's points are correct, but both are pre-existing and this
> patch does not change them.
> 
> Before the patch, a probe() failure returned straight after
> usb_generic_driver_probe() had run, with neither the configuration nor
> the runtime PM reference undone. That has been so since commit
> c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
> The -ENODEV fallback has re-run the generic probe under
> usb_generic_driver since commit 88b7381a939d ("USB: Select better
> matching USB drivers when available").
> 
> The patch deliberately handles a pre_probe() error other than
> -EPROBE_DEFER exactly as it handles the same error from probe(), so that
> the fallback keeps working. This is stated in the kerneldoc. The only
> new code on the error path is the disconnect() call, which undoes what
> pre_probe() set up. A complete unwind in usb_probe_device() would be a
> separate change.

Since your new pre_probe() will interact with the bugs mentioned by 
Sashiko, perhaps you could submit a patch series which implements 
pre_probe() _and_ fixes those bugs?

Alan Stern

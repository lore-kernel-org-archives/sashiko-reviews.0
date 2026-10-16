Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42934D38B
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120785; cv=none; b=IjWvk21av7dUd2Ti0tf9sKJV6xjH1DK4cviv7KtZHFPGSBZuzrnhwzkMqqIXuTBXamyO8hHu2FymaEMc6aMWr6PFRZKLlUNgEThM3kBdJJ3DDwPrV//As1hbb/cLbiz5auUx+1vZIqjHWo9Z0bJ69bdgj5RPWb0K+1TOj5ULBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120785; c=relaxed/simple;
	bh=LectKxnVPgl6kp2WA9jYepcXdH0Or/Oem/uGNpqc0Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pe9oUIYUGBREWK+G3gvvdF6+FLHpsO9ei4ZuGltPqTkDaNKILrtZMy1ARJFmkMVZ2vDp0LSO+8k1acI26GRncGnASwCIvytUFU9h6LLK7dnaRrAlPq9LUaXyiwzOOViDn9dce/5+iR0on62Oww6ZCR+Z7VoLfiFfJx4mxJomhzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4rwpiix; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4rwpiix"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so3523089a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120784; x=1792725584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TOjkNOOOYODKC3hy+v06oUAuoKTO3qPUXNp5ApotnM=;
        b=d4rwpiix+Y3zyCUiTPJDF4p89YuOCbHI4Ya1GERsVtygydkZO6TssH7Ic3im7uiQu8
         ELnu+tzU99MT4BUdQcGJ7lzaEaR7wc+i3l6cdecAtTIdp15+3sHfGAbMUDkH4FwCFcma
         Y/3qxlMLP4g7vBn5kluibemfonbR3suUWlP4nllH7gV+2/sSP7nerU6suBS0kSivvmoG
         nCCDbmNyuLz+aI2mG9dlvSeoQm5NGaN+yjMXx3s83QVahv9yyoJTjHyzfh6cJFdD36hE
         ICVlnPorAc604vGNtyuLUHZjDcvRQFG5pPFc94iREF4Epcrmqy1GGWCOecE5jw5bfesr
         AY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120784; x=1792725584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TOjkNOOOYODKC3hy+v06oUAuoKTO3qPUXNp5ApotnM=;
        b=m65gbKNd+Fca14baRwAxATVBMmcEJFtpKeYij9bCeHA6bIOD9MozlGtMM28gGRHAeV
         2vN3pif67GANEiUEfHuJyxPdlxbvGGKIbToJWR5uy6mCaO3Jmb9SNM8L/U6tskD1A0Bs
         72XImrod0JEO08c2JF0zV5W/uvqcBOdoMgK4y/bspnv6E+9B3Ymsv43+OYOVtU/aLMZ9
         XmW4/FcitSzJJFRxOFyPNakMTHIN8Z2lZfQM8HPhUlEDunp1padCTqpu2ioBlLCqseI+
         ioe28HExJnwh6JxINKleNUhxE3WEeB51TEzMbPU6/RSeY1KpjBFKNhM3f6esLo7322Yw
         /mRQ==
X-Gm-Message-State: AFq9FYIQqJUwRmeHcB4fQRJLim+uAYwq0FVwXDX8eok8VlvgwGmlxJ+3
	JT1mEkJYAZyybMDrOlGbNkiskH2E5XVWcm4HWxNXL7HVrKvRLWLZrHzdPJwxXoPi
X-Gm-Gg: AYBFou3QANOAzE/5HK36Kvp21nAtieX5bxwMlfUwPEbrqpwovmiZa4qwUHTPdBM9qcX
	xZY16nVFujm7UaHlAfiu6eFIg4J/F0dLIZTsBDQRL2w1VV86Y1yKSfU7+3iGdnvHP4MSWDxhRDC
	9dygzciiG2OlJgKLzH7sQChJCOmgJnZXb3I+Ux1CF3PMkYpDjAkqXDQrcbSBhMIT3w6mn4t9dGm
	LW1A60XhYSKuXr4PXXJwVg4YpGizqpxbSe6LV5Trs6C1FL0G+E/pkWvlSfOGm1WBECHc7axQhmQ
	96ZNC1szwXzUQwEf2LPIZ5sQ4+ZbRtXpqVZhSueC6YezB45RvjldHxxKhzmhcCEM55lCzONWXRJ
	W6kp/WNqoKqNaQCOWe6vBjMETOxuMF/43A+uep3KoNVbq2Sws6qPQpow7I39YiV/9qvT8tM7tNB
	jTZ4beEp8P01GsPvQ01lwJn6zI2I3l/is/vwP6VqOYu2pVG5L2QL9Tf/G0hI5zGgDwnCrcow6GR
	xBsxLBD8UXq5EAV0g78HYLqakUSgK59RmyPICC17F+VTdSCWOq3zawIC+J2SLgH8mZ/3W0y7U9H
	u3nZXt2HdDcyuG9xv1X8zfIjeSI0oe9lE5k=
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr15840009a91.39.1792120783938;
        Thu, 15 Oct 2026 20:19:43 -0700 (PDT)
Received: from sanjays-pc.govzhome.govindz.co.nz ([139.180.93.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ebe40sm1960144a91.6.2026.10.15.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:19:43 -0700 (PDT)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: santroller: add driver for Santroller controllers
Date: Fri, 16 Oct 2026 16:19:37 +1300
Message-ID: <20261016031937.824565-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-173648@kernel.org>
References: <20261016025403.779635-1-sanjay.govind9@gmail.com> <sashiko-outbox-173648@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 03:06:58 +0000, sashiko-bot@kernel.org wrote:
> > +	for (i = 0; i < SANTROLLER_NUM_PLAYER_LEDS; i++) {
> > +		if (sc->player_leds[i].brightness) {
> > +			player = i;
> > +			break;
> > +		}
> > +	}
> > +
> > +	guard(spinlock_irqsave)(&sc->lock);
> > +
> > +	sc->player = player;
>
> Since the brightness array is read outside sc->lock, one thread might read a
> stale array, get preempted, and then overwrite the hardware state with an
> outdated player index after the other thread has updated the state. Moving
> the array read inside the lock would prevent this.

Agreed. The LED core only serialises writes to the same LED, so two
player LEDs can be set at once. I'll move the scan under the lock in
v2.

> In the driver core, dev_groups assigned to the driver structure are
> evaluated by device_add_groups() before the driver's probe() function is
> executed. Because hid_set_drvdata() is only called later inside
> santroller_probe(), drvdata is strictly NULL when this visibility check
> is performed. This causes it to return 0 and skip attribute creation.

This one is a false positive. really_probe() adds drv->dev_groups
after call_driver_probe() returns, so drvdata is already set when
is_visible runs. In testing the attribute is present on the gamepad
interfaces, and hidden on the configuration interface as intended.

> > +	scoped_guard(spinlock_irqsave, &sc->lock)
> > +		sc->output_enabled = true;
> > +
> > +	ret = hid_connect(hdev, HID_CONNECT_DEFAULT);
> > +	if (ret) {
> > +		hid_err(hdev, "failed to connect HID device: %d\n", ret);
> > +		goto err_stop_output;
> > +	}
>
> Does this mix goto-based error handling with scope-based cleanup?

The guard can't be jumped across here, but I'll move it into a
santroller_start_output() helper in v2 so probe only uses goto.

Thanks,
Sanjay

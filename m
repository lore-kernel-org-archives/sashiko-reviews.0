Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69742CAE0
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134836; cv=pass; b=RPU1pE+FWtp7gw2hqjsASvvJgCLCEOwjaPdfZQDgNO7ioPYGjq2DDEGlyL6kcd7Ne1Bebl+X7tToj/Vh9ldCU6yfoR4HI/lScsjw53cvNkiaueE/criiXkwubYJnO8BuEBJTKEo+KLKhLGLTzT4J7qwuYEulUle/ZGolPqGGNlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134836; c=relaxed/simple;
	bh=lC+SLgB1AHFRxizEBCGTdbwr3jxvVqS6t6ieXv54AIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0yIqpRQouK9jE9aZMERz6QM8KGTY4jWUzlCLaFwPtw7xhAH+MrEL0p+r2CgVBsVA/5P5XcsWuaIO/KV0mtDx8b0JG9ViA3dhxpeAINgefPYuZsowJup++4MH2RGAX8+q3s+/Dp3mQTC5ItigOli95poo9BSnp1RMovkQkLAtC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAYcmPlj; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAYcmPlj"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so1020593e87.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 06:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789134833; cv=none;
        d=google.com; s=arc-20260327;
        b=Ky7ZBr1OWTT8rOxk5lDz2cuSWQXqlEo0i5Z4wDzSIfiJw09Zg03eZw2HsIfC+TLJGk
         zlssmNeXSlPdbVeMnho1wtMQZ+kLXXOsCsleYoaKUD22GSGLn6RqO+ZYzfKkmjH4L41+
         5D8H6uxVLHPr7ESTToNxEbWusVN5nrFzbQe+njZzuaRhV/S6BF12V4wTVRFlzQtEdo8g
         wS19Uwl4AqfCqIA2VuNmETPELcXyNF+ay+/tbew/8wvCHatf6sz4u10cNPW9/WjIes6+
         qCnRCfyicHtebt4G3So6pAN9A5HJa/1M+xd1+dX9TBAV6/dHXxEnMCZvfQn5oELZpUWu
         28Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lC+SLgB1AHFRxizEBCGTdbwr3jxvVqS6t6ieXv54AIA=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=GwVuhnkhB45jnpY9ySqV7tcv/39BA+vN6pIHURuZArJBkh7cA1IvfzzettCcdyF1E9
         JnZUJWvV5TstbcYNVUx0vpgSp0Gd5LYVyhTv+zER68QTOHplpIg8bPk5UPzw8vazVshp
         JGlrxvwka0o/lMZy9vE5pm2EKoplhzc79g8qg0FcVbowZFKnKlOZz9d2+4kItsjvVX/q
         JJNI7N30aGaTT7WXTRLgDMlT1OsvPJfHYE60KExqLk1fTtFxOZi0LcJwSBkvcAAmsl07
         ofE8sxyjUjxTFbNvAQA6OtNeuQ6TyMAIYV06rPcKPM4UnH+49mlaKt/CtoxeRAk8pjMO
         9eBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789134833; x=1789739633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lC+SLgB1AHFRxizEBCGTdbwr3jxvVqS6t6ieXv54AIA=;
        b=pAYcmPljttxyAsiOryg4MFJ/7xvcgVhflNYzXNOa63z/91hgD47KcYqNZGgDKvTg7K
         Q3kFICbFRj26FbNQVW8dEjt1UtMAHV991LrHwa+WUvEuoz3IiNzEL2dfD2ZoG+7i+ONR
         uBNYVISbJnF/PzukdAYPnq+6KcQJuGUSuyTQWE6zOtVcuHPKfJyd7Wm+PuHxUkb4xp93
         x5giZ8gfcaO8OfN2VMw+F3j7TCTbtD2ej5APHvBLYVkGoB73qsc4dbi558ZApoa26icJ
         8kGGA1e0mDfAajpdDPJSg4HCiMQpbjSOkk94LiXBXvbxM2TQPVYUu/Z9LlRzc4EoGNrA
         icyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134833; x=1789739633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC+SLgB1AHFRxizEBCGTdbwr3jxvVqS6t6ieXv54AIA=;
        b=iL33hevMGBFAyMlnyrGYq8dzPyUhzB+Bknbpdf2AGoeWEG+Is78PwAApAFqE3GioCZ
         tIUa3bsMPAoXeHW4xn471h05c01Qw45sOPnQ0x0hV6P2GaEOfrsNHTG2uURys0T4R0qE
         gM+yimEBo2nPdG11CLGqRRtPFuuDf+Iws0DeylbvOJspdFBJs5yvbDEAMw3coYTRulwM
         SP5P26e5GZOQbGQoeflNvQdr9djExtoIAPtMXUpKZgEm3lB41aO6TgKhLojcmd0vbUuw
         uEPc1tjmwPCaRPb381iOJIhwoi3/tBdv6V451qkdFQPD+mjTduHABSTAKe8s9GIYb2RO
         FQxA==
X-Gm-Message-State: AFuF++kzLmeDjEbRQrFctCyagPlqFV9275TED9/AJr7vV4s5TKCDauJA
	0WNmaqm+Y+f7A8sAb4SugocnA9cn79m88tjwR0l4pxRrk1Yyup6xb3iI+T9sijDwPqdbjLp9q9z
	dhb37dHhrOy4ZSgRJO6Utrfi+bLgjoIGO7/4i
X-Gm-Gg: AYBFou00ODD+lwxSO74swyb7n8eTi32UY70Asgo671SCJngaVUMGvzuosMhcksvJK+B
	U5yQpQw9WJAjgsONwJm0H8MVOtDW8KIfiIkZaR77a2KmsMfPTymuzqJQLda68Hta6yha4w/6CKh
	xfCgVdQGYrOgjmh0ExbBjf9tGsITnuLgm45GWwZ6fKh7p/ed+6y2JYISLtwJz4yaivZBABs6k8v
	xYnrlYbDpkgIg2v2o+tmOanctrYQPLADpeCLt3MqCIIqIxCt383QRgzhHU7BKqUJWWyZoigDrSX
	8xWbbgM7uc0kCvC14YMNBhSIXaUR5HL8G7TFS8KJUrobJGxllg5qPaSEa85c6NsxaOrjKDdx7ze
	ClPAZP5uOFWcHSg==
X-Received: by 2002:a05:6512:1329:b0:5b6:1a7c:59e7 with SMTP id
 2adb3069b0e04-5b8a03182a5mr956226e87.65.1789134832601; Fri, 11 Sep 2026
 06:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911115346.17133-1-meven@kde.org> <20260911120208.21698-1-meven@kde.org>
 <20260911121058.3B7DE1F000FF@smtp.kernel.org>
In-Reply-To: <20260911121058.3B7DE1F000FF@smtp.kernel.org>
From: =?UTF-8?B?TcOpdmVu?= <meven29@gmail.com>
Date: Fri, 11 Sep 2026 15:53:40 +0200
X-Gm-Features: AcwNN1V4lcleQzKLHYvViyVGqvNHJTcWxO6dU8SGMBM654mbATGAY0hn6jvi84o
Message-ID: <CAOvFf8P_grCiKhqdgbJccKiyuQsv6nK6_NftA=7mcbMszVrpCA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: logitech-headset: add a battery driver for the
 PRO X 2
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The HID subsystem guidelines specify that hid_hw_stop must be called befo=
re
> cancelling asynchronous workers.

Stopping first is the unsafe order here. logi_headset_poll() ends in
hid_hw_output_report(), so a work item still running would send on a
transport hid_hw_stop() has already torn down.

drivers/hid mostly cancels first: steelseries, steam, kysona, asus,
nvidia-shield. corsair-void stops first, but its battery_work only calls
power_supply_unregister() and power_supply_changed() and never touches the
device.

cancel_work_sync() handles a work that re-arms itself. The only
schedule_delayed_work() calls here are in probe() and at the end of the wor=
k,
raw_event() never schedules.

Which guideline do you mean? I find nothing on this anywhere in
Documentation/, and the kerneldoc of hid_hw_stop() does not mention workers=
.

--=20
M=C3=A9ven

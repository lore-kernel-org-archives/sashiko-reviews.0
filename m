Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675071;
	b=iPgOKp8S2g96UMl/cxL2UK93d/RUUAmwYNynz2bMtH9lTD76VaXHkzmvAU1oRRKVNRBs
	 +DjvREm0DL5kZrH2Q1aeODKbLtu/s2/6wgRRHFbakHq2bxcVnLx5QS0mR+AhPW0ORy2rf
	 XT7+1tUrgMPcIcK+iY07e21dxb3V4y2Pe48dCtpybIcjS/4ofokczjDnE2ydxPNF5nSR7
	 y+XC0kZyMDkflv6C2WaVCC3YMYGP34542PtiAvPM2kCI+bac5Qwlt6gj0Z88WhHY4aia0
	 YZEgLovxrTxsppFTZ7NgV5vE2RwplwO7mqdzA4C92XrDsl1MnCPGk6CyrMMuBtHtE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
	b=3FVqKtCrcjISOvh+TAq5pereicINDt+wGMshE8MDhxrtVpFCtrd7PzoAS3NuHD6okh4b
	 a+3P3yeVoM1UzXCOsNI0jxZWBYgYNARiYKlh0D9z5lOUA1CzWEBQH4xYMlqjipXnHht7S
	 xDL0Tq66k7rTim6Zn9+MqMf7k8ix4f+zU49+zpOAGEZTg+ZfdytfkpRSH6gzzvCCGeeMD
	 39PKBBFcwKVa9yQL7AO46qXyngu5uHOsXH4AK9CKfHlpU8D6Y/xWWyOSCq6tui6ZwQXZV
	 UZU4RBEFmzcssIqDh4L32GFz3a+7T1R3f6CwF4GAfmevk5mbu5S3ZNR72OMfE9GJt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krk+lOzc;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F7606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krk+lOzc
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso3463368a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 22:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675070; x=1796279870; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
        b=krk+lOzc3T9GkRnieAESBWWhc//j6HFy3KQ6W9BYlnV3SsH3KqY0+U94ewFNPs6rG+
         c8g88RfKhRAQkIDa+fVGRmuzVoQWFejPOPV2Q27k0oU/0h91aCVpgyCkwPpONvxIH+ZN
         6xGdwOHsNgg35RQK2k3dV+jSkYh2Vd2jVckk5Q+YoXopr9L7iABzZbDQ5vFjgXd52YUy
         9hO3a3Gqv1TakROG5xFfTP1dKN9yq2h1rV9rKAYNhu9WDFhZ8qqnOuNrsjgROrsRVbFi
         LDfLb90MkfpkYxeayVr+BZUnl0xYNuG4vhokcc9CKwRzqJMQS1PO1+G6K4KEe5TxWQ+z
         aa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675070; x=1796279870;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
        b=vwnIdHsA19YOMi47M7O32uRS4gP8XJ6wspws4bnoSsplSp/j1mb+EmZA+Zvfq17FtU
         wNvR8+wEF5H2DuncDaEUhQDqZXpQ9e5xSn5nHw2P08Pznwn1TSrFz5x3jvkWbXhp2v8S
         9OTdQup78yW9pCykCwkZAIB3wpfKWSDkMEZMR0KepE2a5vypn+A0zw0MqfmWz6/PwNp3
         88hfTyjW33XeiHgLE4uFURD5TC2LLaKM8leSgK4tsym5I309Y4iluUuhjxXFA1DQk4bC
         yqPtRNFdq1MSR6IXMlW3HNJxBYu83iBpprHy9Aa5QODgpbhEBdblFqqX6usq1JVDErmL
         OJzQ==
X-Gm-Message-State: APuU4Z8hiXfOyKIZRJzzPzlCCj2+BAJYw1l3FMBpozBplCstsAjttlOA
	W9ACDRnM8OLea9HKkybTDAjpx1ABCHes8MtOQaD1VOJyLBODN2km/qi+coz9Ci6SRUvlgw==
X-Gm-Gg: AZFdTZesQP+RB+EJt2MAXfkQx3lvTkmZPC70fy/06jSYOPj0PL0NJJ0Yy2N26BleavC
	DM+CP+fdpKVJVod68K4dBc5pdddS163tFTX+2ZObZxzFBQOeYDz0m7SFxr9UhWyYKb8kc4DA3vI
	reUcl3mOJqWylPDRCoXrLFNhzTCf2oFCMYMs4MR+uWERRKf2iPhMzHtLupmNB1hrC+eqUyBtALy
	DEHwpNLO9y44oLEY9EIiEqBjkn3yU2sp200/hWQzbALWsp1FsPDdX4Y6D/1N1jQ7hnCqsc5Tylf
	aKj5dIDOIj2mRbTgc7JIHHNf0J7blGxKcZ0LpSu3fEU4Jxf9wlY3yZZyulb+lPkvC+4ExDUioNy
	H8NVz0jpjCmNcEZ8RBdk7ctexcjFQ1ctjDAEkQwPGrYQxpoaFOmncpbV3B5uj1ncxeXBGD0dVjw
	+zUvJvoesZwDCFk0gsij+HXvSb9pSeSYTdyUdx2tsWQ1vZAXJgNCNPf0gRTfp3wTOwTjKTjhSq8
	r3wwipPlOaUtyoQx/Ia+Np3CZoUCEmkWKb/Upn9XBZL99E5sPEq2gZCmVCaTYBeBdUvBDaswHz/
	oBcHd2lMm9nTeljD2gwWdEcnLbxXa1t0R9i5Bsisf0HnSqIly8C/VzrT+wJWAZKl+t01Frkk5YG
	MW1bWuVSjfeGv
X-Received: by 2002:a17:90b:2790:b0:3b3:b417:607e with SMTP id 98e67ed59e1d1-3b41c95b3e3mr18364773a91.44.1795675069879;
        Wed, 25 Nov 2026 22:37:49 -0800 (PST)
Received: from smtpclient.apple (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm34061239a91.12.2026.11.25.22.37.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:37:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: restart DRP toggling on
 Ra/Open in TOGGLING
From: Ilia Snezhkov <iasnezhkov@gmail.com>
In-Reply-To: <sashiko-outbox-234503@kernel.org>
Date: Thu, 26 Nov 2026 14:37:32 +0800
Cc: linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54727A64-1EE7-4976-B702-74AE116CAE84@gmail.com>
References: <20261126003308.48940-1-iasnezhkov@gmail.com>
 <sashiko-outbox-234503@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Please disregard this v1 patch.

On further self-review I noticed two defects with restarting DRP =
toggling directly from rt1711h_irq():
1. The unlocked TCPC_ROLE_CTRL read-modify-write across =
usleep_range(500, 1000) races with TCPM state transitions under =
port->lock, and an I2C failure after clearing TCPC_ROLE_CTRL_DRP can =
leave toggling disabled with TCPC_ALERT_CC_STATUS already cleared.
2. tcpc_presenting_rd() is dead after verifying TCPC_ROLE_CTRL_DRP is =
set (and the case TOGGLING check is in _tcpm_cc_change(), not =
tcpm_cc_change()).

I will re-evaluate handling this under TCPM serialization before sendin =
a v2. Apologies for the noise.

Best regards,
Ilia

> On Nov 26, 2026, at 8:49, sashiko-bot@kernel.org wrote:
>=20
>> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>>=20
>> When a DRP port using RT1711H/RT1715 or its ETEK ET7303/ET7304
>> compatible silicon is connected via an e-marked USB-C cable (for =
example
>> to a USB-C PD charger whose own port is temporarily open), the =
hardware
>> can stop DRP toggling during its Rp phase upon detecting a single Ra
>> pull-down, reporting CC_STATUS with LOOKING4CONNECTION=3D0,
>> CONNECTRESULT=3D0 (Rp), and (CC1=3DRa, CC2=3DOpen).
>>=20
>> In tcpm_cc_change(), case TOGGLING only transitions out of TOGGLING =
for
>> source (Rd), sink (Rp), audio accessory (Ra+Ra), and debug accessory
>> states. (Ra, Open), (Open, Ra), and (Open, Open) fall through with no
>> state change and no call to tcpm_start_toggling(). Because the TCPC =
has
>> already exited hardware toggling, the port remains permanently wedged
>> presenting Rp: PD chargers never see Rd and never source VBUS, and
>> [ ... ]
>>=20
>> Drafted with an AI coding assistant.
>>=20
>> Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
>> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> Sashiko has reviewed this patch and found no issues.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261126003308.48940-1-iasnezhkov@gmail.com=
?part=3D1


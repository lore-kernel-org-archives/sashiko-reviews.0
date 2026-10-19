Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453300;
	b=COu/jtWy91Lt5Vo1pAfTbXZrj0Xbur4tHI72RFNau9djshXEEN29ShpWEIrd6Srq8dRf
	 aWg35FBDYfFObztgLZlyljy7u1iggtPNjn88D1mrym9bVZKeRs4IW3tWmCFPMFGG2sKMb
	 Ym6tZdrbVbFyPt4mal3QASMKK8DqkHs0SueJLV4hMW6PAv6ZPh/90ofXNJoGQLugRYqlv
	 9XDKsw1nU1DNF0vQ4Ep+iGTChQ5j8jGMlcZXpbBt2piURqZkqCTNfEDecGE7suZHoaC3S
	 Wwgm6zwdXxae73SlrQ8WcpNZWtwJjq/QiRkb+JsYxb4KUAkYKT4ia7g2YdI2f2/bBpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453300;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7aC+kbHF7oT/KrqoLK+/E40vn1EuS9rDxxVzyndSI4Y=;
	b=dEJVLWv2bxNmDojqMb5vQQEBPjrl0jkup7S2S+ZXPRIhktIkdoS64fs5G0gkZgePpZTm
	 xEuG/DxNAvNIDKezPr7Ax2FYztjJ095zJgr1TZ7o4RjmUxZg9M9FJ37vp62x3eMFaH3cG
	 HYfRsjLgxdPQscpn9KULb85KyWO68Rr/I6SOAnCxfa1wnAkYlj+C630Cf0P3fZG7L8cz6
	 84q/ePegOxM21k8OXao8k8fjfVGX4Ly25mj0jdDGHGgRWCsBEYx7LJmiQn9vIpoTl5lV0
	 mU+8oiNlhNDgPcCpy55UK2hwu98YVbZyLsK61PNyRhubWqX1YwsW16cXk0LlxxmDttA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Ayo2iXAW;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D1606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 23:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Ayo2iXAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792453298; x=1792712498;
	bh=7aC+kbHF7oT/KrqoLK+/E40vn1EuS9rDxxVzyndSI4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ayo2iXAWaxYnf85XH4A/89HSLiZjxznJNEaqeH108n9cT6LgJp82eJ/+VaXPV9WJJ
	 ob0K27vTUuEyF2YO7kZ5UgYuBMtkq6SLDenQ5s7g2yN79oRkYyD0X/WVYTjkwzZ4P6
	 +a1uiJ/LunuQxApIS3iLLQmbJB24mPtqqDlgMpp5RJj9JiPMKUYLEYvHfkm0tRJRTl
	 jh59hkKrOYt7z2zKf1Mf+fxdnECeW8WXarZw+YBlh3HpsZzOkgo7JoKRtKewJ8070j
	 4TaPevnfIo9DKOwjFEOjesYd0+Eq/2Tsz77HTyGzo0USWPDWhFaNrPMopar1gXLA7y
	 vyhpTRGI+PMDg==
Date: Mon, 19 Oct 2026 23:41:33 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: samsung: Add Exynos5515 pinctrl configuration
Message-ID: <Zeheq50PfU5w7xuj9WqBdDR7Dzfk0_WvRl1hwTn761hT0eFcoD44Qj_5CNmP1lNrNIHVFqqqjW7I0B34h-gWXXLSvAbHEph5-BgPy8PwM8w=@protonmail.com>
In-Reply-To: <sashiko-outbox-177786@kernel.org>
References: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org> <20261019-for-next-lucky7-pinctrl-v1-3-0f77e94c70bc@member.fsf.org> <sashiko-outbox-177786@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 22c814471cec98396341492397494b380142ab88
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] pinctrl: samsung: mismatched EINT config for Exynos5515 FSYS con=
troller
> - [High] pinctrl: samsung: invalid exynos_eint_gpio_init() on Exynos5515 =
ALIVE

Will fix in v2 shortly. Copy-paste error.

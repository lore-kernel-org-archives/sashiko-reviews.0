Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657492;
	b=rqqDOs7CvQtv6Uu0ysm7HTmgrx8i6oOeIuLUWFwgLAFxu12yP9IZuXA+ConQGdwiit58
	 Yb32935T+LeiBhcHbTxNzra/2L5UPcWo+Yvlv4L+HQSR9MK1mPezvffeCHmEBGGlNB4RT
	 YfJm+3hmU3HUiA14f+LTj5O1dsdc7hmx4n5Xan4klA0n+vif1GX2x9GbkoaSlJifgUeJq
	 Vwg3SzLreZTslD/IJBA2OuFIVAUfBGUOl8/4K3yCEMlJzIv9rEV8witC0MZ4+0wa0L7g+
	 EJWwlRze8WhZF4qnU6lOlM2G/CBd65qQ8IMwOsmJk2aVfdJNZmelWyTBgoOmI405ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
	b=fUZP+80qzKHKthtkE2/5NIoljrr1z11eG90nAt0jzYBzI8xLWUg/L2Z6wfLEadmcmoFY
	 KcHk14haJxdn++BUG4ZVsMa8/IdGcApPkTC8n6/CS4po4M6oXUelBMLeuhkXnU3bLVknC
	 OdXuSS+eDICk34Jn2Xy23WVrFaxgYfdyrskj6rsrE44zT2KjBwOWSbWoEbQIzzD1qa1XU
	 Lxn7NaIN1Cebd93CXTs4ngzpQN/O+G/scJnxQ9x9tFeSzfQN8aw7nkHJsMHJXSOVKacQY
	 KWGlgkSBYp/q54G+/RmCAeNDV4EL87jG4Q1EWitXozVK1+m1DSOrCZmBlgkKn/6Uo7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMAfLVFK;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC72606A330
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 11:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC72606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMAfLVFK
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso278648e87.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657490; x=1795262290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=xMAfLVFK2HiTSbkGb88NLdcDxwHSshTsSJMJ0vr1GmljHAoNLSNla8U9Fl6NNeFHE8
         hYefxuLkK8WNVGDlWKgmAQKpSoN/5PaGPXsdgdYenrckvFMAiy06PPa9Oy6UBXWv+5mb
         HfpN6VXQcek47Jhg8MWoeiTVLSqPEWmF3TtcZVlQTb4T87udk73mnxLD4b3IPnL1E9ZH
         nBD2MQf4A8J7bkcgxFeujLZ7bNOsod1vKQqWdgcZY91kOTQ3zFKDaa2pBz13yGAm/289
         aG8ZVsOoTKWSFmxcbXJJ9F5Hbw1DT3ZCqaMlTaqTTS7nxVrCEB51jR19EfbSP3w94IyK
         McsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657490; x=1795262290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=CoxoOkbnAJbK94bKHDzl+QC6u7iAChyfC/GjMON7bAfCes/w3YsujnPwGxXxPwe9QD
         9C7y2te4Z3mLZGpnyDIVKfeU9iHx+OikftbcixPwujGDGJV9AYbTIvGz1c2s8wK9CJaY
         etcshsKzia1PFzitdm2447CKkWC5g+tZmnSTuyNmnkejDUk3zC7LROFzh0TvyyuW/kpc
         VAeSm9H+ZQOx3u/s24bYBOlvfP7Q3dEOZ5NQw045366IfAB11oKE20QQgQWThQep8xKG
         O3f98YIW1fDxdY5O/iVXeEAb6oeOa5kBWNx/YCs7oWWTHWh3BVU+RMSifdEI3HyJ51qf
         tnmw==
X-Gm-Message-State: APuU4Z+ID4EIyD4zeLooSN4AGQubR0GojyqcB1mqIBhAdO7QGmW0go5y
	jwTZiIUqcnvKtBjZsR/WN1jGwbWaxV8MoyY/s1ibDlFj9rQw9QrTTm4inxu/gk+/
X-Gm-Gg: AYBFou2cyZHtgiXYRjveBdwlNw1vL/LxjVWFMK5/iGq9Fq+xeUHbQZdbva2NSijgcQ5
	aBtBiTz2laZT5RuXpmHg7Q4+n7KtJypPgQjh1z8MyB8G2Ltru/3MgVcZfTtarliavbPrAHzBEnJ
	Hm4RfQaY8d30MA4X/oa/0xxrlcngzhbzh8hE35EzCVEz2OQb27WV///zU90LCbGROafRvZFALSh
	KrDcmEaBXWoTMTRUn89rFLH1tKwdRJM2thcxjGVg3BS2ftMbl2FCw42DiND+vlBlM7y6q+7bUod
	4N2QNMRbqIAdB4IWYCi4uZAXtqT9DGqP3sSjRcGjEPIR7YnoGWhMenBMuMOi3r8DFjnBRTxzFKZ
	oglyrohdmu9hfdqbnmWGTXUDhvVqZsLyiCCyHf60l0/eUBjzE2cbtIQIckKBH8W2e5tdZF++WlO
	nLBxEkf0aB3/FZB6CzH2k7ugmI4H0AIqVQhP7w41nUj4EfNLhJCSBpy9OvVl9kl7ewqTDAoKZfn
	9jnvLdD9l51AdU+iK2zsStckknqCI4PlsX1sVsRYlo/UOiEL3IBYEoSpsKvrLJVD3pSVtTxaejk
	AjcKhfdjw1LJBJMgi2SH92vR2DBWjfzOCDXMQ83g+f0Xb6roUaLSKZmt8ZpTnuOW1rA+cFhRZOP
	YhZTktqZkYkPVs9bR/ZClVoQ94p7B2Njz8nZrWBc=
X-Received: by 2002:a05:6512:1048:b0:5c1:5958:a7e4 with SMTP id 2adb3069b0e04-5c17077eaaemr1886702e87.15.1794657489552;
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c9d3sm1606436e87.38.2026.11.14.03.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Sat, 14 Nov 2026 13:58:01 +0200
Message-ID: <20261114115801.57701-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-214316@kernel.org>
References: <20261114083828.18059-1-zoone.rupert@gmail.com> <20261114083828.18059-3-zoone.rupert@gmail.com> <sashiko-outbox-214316@kernel.org>
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

On Sat, 14 Nov 2026 08:59:52 +0000
sashiko-bot@kernel.org wrote:

> Does triggering on DPS310_INT_PRS block in dps310_fill_channels() waiting
> for DPS310_TMP_RDY whenever the pressure rate exceeds the temperature rate?

Yes, without the trigger handler fix the cover letter points to:

https://lore.kernel.org/linux-iio/20261113230241.82046-1-zoone.rupert@gmail.com/

It is against the fixes branch, so this base does not have it. With it
applied the handler does not wait: 32 scans in 4 s with pressure at
8 Hz and temperature at 1 Hz, 5 without.

Rupesh

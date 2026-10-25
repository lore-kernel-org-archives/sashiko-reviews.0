Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941873;
	b=ewLudpfSPS5je8mZB2n5/cyy9zLMIUdguPoTfG/3O9O7vZJX78s2WR/Ql4ngY9KpSuuQ
	 HERISce/20HCzEZMYxHyxmoWhYbVkqeVCGXVTrsPD1+3yNUuABkb7poRMPlsVhg1G3QAi
	 2xr9Rru1/781N+m2hVyq5IcpGhdV+5pfTp8dR33vCObsFvc5XZZ9an8NaBgqPGhKU2qFj
	 3jvasOeunLRGiyqeqgSXc/0/icQ0mNeD6O8gYA1Tcy+I1oYGQ8JUxhLz29ZYlM/W2hajh
	 mmduRdDM3S/k4aRBPJ9EAMLnCspgSsSPQeMalKeOJmirXyhbHayr6TC0ZLhK6JWuyZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
	b=pL+OckBOqNkHGq7vMrzqwObKm/QRxiLN/5m07IFl1GPFSLyw+meBDl+VF+etP54DGsFt
	 il61prv5tFM6Nvlh5JpvSdr5I5VmYJHx72FBt1AwmWftKONP2RE+gstkA5W4w4ErlkGiu
	 uxA4p8IvUyGItpWqM3jMAjqy1cntEPA65bvElpWkEiu23LMu92CPN/taIPvRVy+NKgO+Q
	 OZHGAXoxNYBLLBzP1LG8pkxO4tKpql7NoHpKHfxzLiAws1YI92P/3+Q52zvHWtvS3cjqf
	 99e4zCTN2B2Ue/NMqfN5JktP5T/4E32uyIbNpHx7ZMLC4nn3mczQ4t5wqH/rdGgOLPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mqiy29d9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F7606A326
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mqiy29d9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9950645e9.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941871; x=1793546671; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=mqiy29d9y6T+ncEo/JO99Au88pWsNSXQTZkAe/0YzpZ0cxK6rKoFOg+kg5W2yV4gw+
         e8k2/gw8Qt5Q33Dp+mT18eZd4w/JeF9kApPxOTp6ohGeYzI2JdQPVzESE9tUb+olgcFb
         BfvX1LId6LO/Y+w0w9P6CPYVEpcYpDKiH/NW4cm83T6OClIpYoRsuzSE1d/0MJlO377X
         7qVgY0tsBiDgEMs2Q9ih+sjEi4iZoR65INdkgImDpX/SBCAilMz7FcIUwE/yizfBH6gJ
         J3on4JO9Y5wHxEeIrjY1SwbDKC4DXhwx/a9AU6GDBYErrEN4QPjLahKVTbs6Tqmp6GUf
         JKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941871; x=1793546671;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=I14gEX6eTd7KJi+Z7WXLsOvstQNERB4KUwC3aHeUFAhakuKl7WraRFMOt2FMY78JRF
         jOumgEEYLsg9p5iEXwof+iF+P1CTpC7dNQNlEQZlDdyAOoNfqOCu1TITmOEqNd++UhWn
         ouOyhFLebzrlFGAsyQPzlN2VaRCi4ArbSlUx8MhX8v4HN0fXRzWlOpufOBcyU6QaXtXk
         rDb4U8HbeOksjP4tBSZjt2O5KwMoS3+U8+k7DUIhqZtWbD0r/eTPcTaZpCp+1QT9TVLB
         9Md8lnrg4lO892wziMWMHZA3QHWbPwA7MqTHijb9+uy+RMVM7dgdDvCkphrw4WctPacP
         ADyQ==
X-Gm-Message-State: AFq9FYK/cncCJSHfABFXEM9WXveUTe2gxZJhqpzVFvm/eoJwLKGlklRJ
	NWMvu9p/0MeTeUIJRP0WVHtpNL1jscMWo7L8cQD1Vo6iMH9h6+BpivApLx0co0wS
X-Gm-Gg: AYBFou3dPuEe6WgmAXsVmFk2ymYBM29+mPQtqGMOFlHo2WdMzl6GEwOG3nvXvGNFBG/
	q1oTzb2tq9eIsljvZuSunu0qazd4mo9PBukShGJx/moo2tm4M79MgGE/L7ENMQXB2rFfywkPiCr
	SLrMUx5abrC6YcLShg3DNgsocual5GVnSeULk4u8Ulx7/MTsLd7ab8u6cMA2v/jKWUfs1iilBdV
	KQJuKylRBLwdDiCgoEBHmfkt3942Q0ZcDaDeRFBM+VZYVaBKkGfrmQIts3g33xG0q8EBxddlFWm
	msmX229aCTjQzKHHMDipl9O8KH2AKUXdXB57rL9b+rcHKgXH3xBMB3s4JlZA7FWIYPjn3TyVACu
	K2+H1d84xK9u5tQvqjovb0mmpPOelaAvNsDeTsKS1wFZ3NQlVAJdGWo5Q74Z80kKk7QdyWdDEXw
	IIzgR/u24aljuLdAlgbpXRNt62PpYm5QQUKweXldn2U4RJ/FM5OH+NIBc6Z6dWi6ldwUY6kVQoY
	/jSBLrseXc9qvX7ue97HGt0yXjhkz5H5FyxRbxoTCzEoGYn5+07t37RE7+RuENJHr0cSGVyl8IP
	MaithNhKmeC9xAi4+BrQM86RzqvAtyJjONojnKxzTg63
X-Received: by 2002:a05:600c:5248:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a35ac3cb66mr82142695e9.1.1792941871149;
        Sun, 25 Oct 2026 08:24:31 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 16:24:30 +0100
Message-ID: <179294187050.4141843.1375662350308483762@gmail.com>
In-Reply-To: <sashiko-outbox-184258@kernel.org>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-3-romain.tisserand@gmail.com>
 <sashiko-outbox-184258@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 15:12:00 +0000, sashiko-bot@kernel.org wrote:
> Should devm_clk_get_optional() be called in rt5631_i2c_probe() in
> sound/soc/codecs/rt5631.c instead of the ASoC component probe callback
> rt5631_probe() (similar to how rt5616_i2c_probe() in
> sound/soc/codecs/rt5616.c acquires its mclk)?

Right: in the component probe a deferral is lost and a rebind leaks the
clock reference. rt5616 moved it to the I2C probe in commit b5c9df40ca56
("ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe"); v2 will
do the same in rt5631_i2c_probe(). Please don't apply v1.

I'll send v2 in about a week.

Romain

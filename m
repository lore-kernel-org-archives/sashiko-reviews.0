Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3D3ACF05
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931271; cv=none; b=BFtuwxj1lW+1kozCQFGmkPsCr/+qLBL0fEDdWwWfZMI93rl35rHlxf8c9M18Oh1u0PidYST8L0OEdCf3YP7E51fLymH3Hlwm+acYwk4uMy2gj6PoleOo//DwdsR+Vje7oo9Z0BiVHAH7HX6ofQhUZD6EeP9WerJZcLa4NFeRVLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931271; c=relaxed/simple;
	bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvQ7W6p6WrFDuN3gXJ78y1MFi90drFR/NovOvArXVdMkGhS/5GBii0pmTlmkySTDBZ7jlUgBPPiz1ndPBBVGf+FByybXbFJ3imlOFVmwREO5jcNbiMers1FtCxidceKcVmFNZyK2j9Py67v9BS3rX8Y/JAsVgYOp5DT5eVvps84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDhIXPru; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDhIXPru"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so1889701a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783931269; x=1784536069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
        b=GDhIXPruaaQCzokasEsj/P7UMKWOpWpNrtcmgDz3HJHFxJt0KjWQMb6FblQg2KPPrp
         uibPG+Zc3CuSbBlOdjQEp9YHjmKlUFVDTj3cGGvig+wGT324akVcqgR0HsTUryWn/kPe
         sjOpJietLGPKBBjoqoe2zXLWP6U0CTckOPNWQDl+BqLsmCEzWSAHsbBfHiJ/fpUC3dpJ
         N+SK9LnqouWu+gDiTJ6euJjDdHsHk9E6iPoYvsfMOW09+6ufcmEzdNUHHkB2moh+nDR2
         5+Jj9WGRDMifTG59VnPiT6uRBgeFFEJtpnGUHH+kgD1esxVMTVB0HBPpdmOpIxj+jnEu
         CeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931269; x=1784536069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psE1qQi7+JPeylnHpAM99xWnw7wL5EqXGGzHGX0w128=;
        b=hfKpJlvf1YXH9+4eMTu3aQwOJgca8V/EoD5Kul4JcuCcFQDeBe/OWk4+yBW8cIC/gH
         Bun26ZwDgJBidnxtUu7OQDUdNZ3jdTJQK3XFKUkzknYN6SqWdkQKk3F5WXp3Pli903Ws
         qZ6c4nd2PWDSLSQ6THTbD6WxS31rvZBlb+Tm0I9c28/Egd5TR25MoY7/nIZXaPcAv6P3
         tWubbin868nULxikO+IH3fSOWdLmyHNEbWHiHQ8idyoHS/PVrr5c6fX3/7ab3E3S/8eS
         ZAeE4Bo2OH48gOmdUdocWC3q8BpGq76plxR/KcjtGbuV0PGsaTDjIcwUSjZZwiDajbxp
         qTFA==
X-Forwarded-Encrypted: i=1; AHgh+RqCsrFnbc8/2QplQJui40QxZf95E8DvzzgLXVbDudUoS2609h7g6l2JT/V/RzPVjzdXkuLOaotS2yEyDROAsmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YytQy2/3eDOzwX/WhyDPKF7UDuBw9GUUMKIQLh27MU4k15VYakx
	08FC6z6mdSO8GLlITVsHneUV0/ZaT+yUdMKy/zn1nQokjK2vx66NHupr
X-Gm-Gg: AfdE7cm85T7NjliF97UYtbXxcaDl5e3tEFHba46OO5lc2aQh1G2fnBVfsgZTyVquV2S
	66vWF8Bn3ZPAy3Lnv1guCo+LOLtfQX3ClI4MCIpjqx9RVGO6N4vMALQJpPWTSDxBhPkCxBFaN23
	ytgR7tkwsIbu6wvjQP52qzG2xV0xbLBfWYGsEBwJcxAVvdJqZjY9+nP8/nS12TuLDuf7Osk7gKC
	QA1YYPtpN17b2jLqxUnvCZE+0xcW0dgwjQYxfHKMHJBN6y+/0H76wgpAgRPgwF9PZmyACUZTUn/
	8Tiru5iHD8CD9vKa+C8AX5b0kMTTs0d2OLbRYOMGonNm3GRTwkwBvaS5vdDdHJTIaVqEYhuEACY
	xiqhQ+A8zseS7J6OwmFVqwj90oOXbr+de9d5M0AsfQGHOkffyID0XGhTx2W/FbU3q9juV4/GnwN
	5Bpr4kR4r6qru+d8tq8JpcAA==
X-Received: by 2002:a05:6a21:e097:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c110b43701mr8134878637.36.1783931269266;
        Mon, 13 Jul 2026 01:27:49 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58f3sm8021941a12.1.2026.07.13.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:27:48 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Mon, 13 Jul 2026 16:27:43 +0800
Message-Id: <20260713082743.24129-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713075512.A3BC21F000E9@smtp.kernel.org>
References: <20260713075512.A3BC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 07:55:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Will devices using these newly defined compatible strings silently
> fail to probe?
>
> Looking at the existing driver in drivers/hwmon/sht3x.c, it lacks an
> of_match_table and relies on this legacy ID table:
[...]
> Does the driver need to be updated with an of_match_table to prevent
> this regression?

The of_device_id table is added by patch 3/4 of this series
("hwmon: (sht3x) Add devicetree support"), so there is no gap once
the series is applied. Within the series the binding intentionally
comes first, following the usual convention that dt-bindings changes
precede the driver changes that implement them.

The compatibles introduced here did not probe before this series
either, so no bisection point regresses.

Thanks,
Zaixiang

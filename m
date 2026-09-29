Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED751D525
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699275; cv=none; b=AdKQYXC/nPhpqVvP+MEtyyaU7+B1yymzP6xjMg//K6DqWZVqdHje64S5tbX42rQC/KIQCpC3qjxJEf+VmpeKJ5HBRp9hzKjijQHXiX8HrnIDezR2dkAcRRJB/nrJRm9ZuoJNqOouMQPX39t9qGH7bUq9iO74dao5zGK2WMPspjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699275; c=relaxed/simple;
	bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjEcqw7CwIHdEiPJtvayNa2QpcCtnHoXmo0x4v8dwT7v0jHyQWVQgh0NS4wz84zJAr8UibVYM3K3d7WgYGDnpwlsROuiv1La4sQ5JSz5fiyUgyKLhFJiXBOEfF2Ah2WX86zRXKPAOcPkJHoQOPU6h0uBB0iZQwJwhatiMypxQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOz96tl4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOz96tl4"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso21243105ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699272; x=1791304072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
        b=GOz96tl4GvMUzOciCaZGCWeygBOFI6DHWUDaSt7VEUaJYxG/6sWK6Ro215xSHILTA5
         bfzieQnldXD/VRUM+yGkULftwpwWeHtH0lOKEAJUf+tu9GVUHkHSUz7o0xnzHYzGXaEc
         Qtje2NFnRGk0o+h15pjuTDW8vGD6mfhL7Z7DjCRXvSVMG4rUobp7mQRH0CY7aRKYfuDJ
         03lb2wk7/s82fdudNuXjADmH2Q6S2VeWvlR8T91e7KcBE67HShaZF2lkWhUxNWbBRD0n
         /q/nGb4NqXt3gPOZDQJ/dpUr4eb4qGItfmxDREctsjB9GAQcw8oP4Zu7U/Nrjj8ZiBVw
         H45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699272; x=1791304072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
        b=xx7nuQ8r+bjceqsd21/npPvtb2cINjdKJG2hubBo3RumMePD4t5E7wuX2R56A0Yfuw
         NwZNcph1rFvBpgQ0qKfocpDj/Z/BFl7CLJ9G8gwfeuIsrGIwlb1Plxnxl4AJ+YI1zAY+
         MEAwljcTnjKfT6xed0cuKQWvy7tpbV3Upn+vZSXjdNdCsmZeUI7Cc8Oc1Zxrr6Eyh4kV
         rj9fEn5r5vk+6b3KVpVlX2PlSTm2uXZUbMeNbqpj4AWpSsXZT8r7WbflC7LJdTc7MKQ2
         nLSVupU2L45TIWesqLghiU0bCt8xFIxe7rjqW8w2xj72jdwYvUu0ap0hgheMDe/vMgEW
         wZlw==
X-Gm-Message-State: AFq9FYI/DGXvRfPQ/AGYrLL75Qxe7xTIj2/pVozM2qPv1TbaQJI2ItfZ
	ejVEKhN6x8I242bg8Or4TbDz0MX3faS5zgr60IuWrqtZ8YMqigAADT3JvLekxMP47vIiZQ==
X-Gm-Gg: AYBFou3nGgCVzv7JwxyQlFXLrJdOZhp/Asjyj0d5RuGQErRTzVh1OCs/o8tOpdqlClY
	QibivNpS128mR9XY/nxgY+98jPxcQdDW/QLQLAkiDfxA8BfNVjHu19FGbLsDz15WJfyKbVSPHdH
	MHUK4bKFFkitisdspTr+E12PV2kSFUd4xPV4sPsvSxxSkMr937vyWAJPbXJXqedTe3C+vruwtEm
	xoMhnP7edET0Bgv8S0V8IBJEBP8d85vG2exTdyuuQ4vTQPOmd5Pg9Tb1IK6zbMu/N5htabdwmkx
	hXmrTU5sotmFlMyrTU6YwTRPLk921rImyJKrpR0aJvjbq6mgYLZsP1JJvXR8CVZoYmYXbsQCUYm
	I3rC/FGk7GJbeJeYVZY0mOHzFYYg7oSXAlbVJ3Wgv62gpnwTwBp32MDk2t1YIuUldnelB4t9NPL
	RW++7GK1reJUFhyDERcErnlpI8Euf1z4l7BSiTyJgbbG5v6HXlfrnvZzDIFMhKedmcmxa/KQbLv
	NC+e3ozriw=
X-Received: by 2002:a17:902:d4c8:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2df7e669010mr133501945ad.53.1790699272230;
        Tue, 29 Sep 2026 09:27:52 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91475206sm59198875ad.82.2026.09.29.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:51 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Wed, 30 Sep 2026 00:27:42 +0800
Message-ID: <20260929162742.1374-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929141534.358FD1F00893@smtp.kernel.org>
References: <20260929140649.55-1-yaozhonguwl@gmail.com> <20260929140649.55-2-yaozhonguwl@gmail.com> <20260929141534.358FD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-29 14:15 UTC, sashiko-bot@kernel.org wrote:
> Does this update need to be applied to the other RK8xx family schemas
> as well?

Yes, I will change this in v4.

rk8xx_probe() reads power-hold-gpios for every variant that is the
system power controller, and all of rockchip,rk801, rk805, rk806,
rk808, rk816, rk817 and rk818.yaml allow system-power-controller. The
property should therefore be described in all seven. It is not only a
theoretical case: Firefly's own BSP uses both pmic,stby-gpio and
pmic,hold-gpio with an RK818 on the RK3128-based FirePrime.

v4 will add power-hold-gpios and power-hold-delay-ms to all seven
schemas, each with the dependency on whichever spelling of
system-power-controller that schema accepts.

Thanks,
Yaozhong

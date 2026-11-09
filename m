Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253341;
	b=X05NAjBzU2ymaKTscTUtwcQGsutuXmF58ZDm+lhWh7LXDiwLYY9YGp/5DAYRS+ClE/uU
	 CakmPJz+2Mv6rcJ8paxoHSSbD1UUuSTLU0L3T4bSAuNoZnc2U6QwEYS78VEFOAc+cEMvW
	 1DTYsVE8/Qo71tq5NMlewzpvVXRi5/YRdUsX1ZuKy0nMeYvryCdrK45L5bmE7w+QASrPn
	 lub9fHKGwlBoTb+C2wNYya0CH0+apIGyWb/uQf+WDdP1o52bqEoIrdDQuVCxXTfdDfODL
	 zQGdWURpP9FvhZ7r18iaq4LEFMhT3l8aaIK1sVStqkpu5HX5J5V0wpuAype1RY7ojCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mbBQPOCqIPjbtfPgMbeVngds0pJQUl8FFvkH7QvbAp4=;
	b=aN/ST4ftkXKQ7gxkClXwnXpn8nGBuip/nNi8Hxmxu1dxVPMtYSEUcunC/9ey8H9iSp6H
	 DM9iAFhU6t3V+6YURYwog9SFMDuO4YgcgYbc/VjlONuhi8d+6GVgZDML75NU2jkgxrxkp
	 yMmsEzgpPMFbiZ+t8Vi9o+o7dOEkbyKFsiqmbRdq3UrvaDva2Pmg65qUhCruKNZliN3Rj
	 +ClrrYxzom7XT1ScDXXv1BFj6RrQ/v8zUknDSbxBdwPh9Dm8/6vsEWY33lfO7QU8pzQ1t
	 FghlMBbJ2R27ASuOPEXL7mLhnvg7ljlo+9Hy1sBKdU+34kDYtO1zLyUM3HKI6imNL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJAxBE11;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325660A2630
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 19:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0325660A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJAxBE11
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9374205e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253339; x=1794858139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbBQPOCqIPjbtfPgMbeVngds0pJQUl8FFvkH7QvbAp4=;
        b=VJAxBE11jutn6ZEKjPJ1gew8bgnsIbikjpgp2WWaF+atAbLm8+3PHcqvFVgTLygKQc
         znaBGApEA+quKLv7E5IXobaUuaQB9rGzZWfMonWD++cgB2slpWnMGS5lmW70LBdLfCHR
         o8Vnw2cEkxOFJ8Gu0TklexsVsrWoEy+ZeScl8uXSSk6AavM6WNFDflCkUT2SWgRYn9OJ
         c5mTZP2pLqxt4fZ5HRs82OgS1vOnNYItX+xw+1ac4gZvH00J47UO6a8VjbvXuQRxLrN0
         yKhGgyXnirwQPdA8Xr0jBcJbzzAThT2DQMjqavE20xX0vOi2LhWgC2e3VpRK0xDvkcF1
         yiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253339; x=1794858139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbBQPOCqIPjbtfPgMbeVngds0pJQUl8FFvkH7QvbAp4=;
        b=jPn1WYGH2GDKpBerMcaCBnVn5VuN9Kq4UIMqiXKlfP74G7qS5WaPao88p5ljX2nZx9
         k0bDhphMtQDABHPfplqg7gXY68ghW1lhttfV+L6HEHpT6PVSGlnN7X17BaZwJ5TJcHMk
         9iIHMgjjwTJzVKZ0XdxadpM4pjNnZFH5jHCwqpV3yVaHCqo8Jw6oHvRy9Gm1fNNyAO3i
         +DysXjgzM/u5tyihrJz5er8FIcIpDDOD5NB1HK46d6O/uhPgoNwiY1y0PJQzAlkaNnmV
         El2Seth+qUJdFN8/TPqmPTYOuY9usvzHjjV8IWCxsKab94fI0p6DXQc5JolvH4i6/CaX
         Hg/g==
X-Forwarded-Encrypted: i=1; AL+hErE0SxtKIunLZp8zshDBGLdj2Vn1KBQmrPI6XCVJbQDQOwPSnf7L0u7EqZcOJhOTGM+CiQZsHRBO9hjZGKpujIQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8xEOGS8DnXotGp17lC6RPfO1a9/ZlaUyWDETogeZ1XHxKs1I3v
	8OpuAWUMsBR6ynWx6Y4m2ww/tLxkSLD8OpADI77lJaG5y8qwD4bQz/jU
X-Gm-Gg: AYBFou3uy83P7Jrzgsj7sHhpmMqjkJ/4lmqjCMShQT60C4Sr0IISCt6ffTIdomsV2DU
	dSnvN6ioL4bnbEovfBh4uZRMECCK+rnUF5kZSul8PVL9XM5rTGovvmPeLBHpaNkERMODtk7/+fp
	xpb/LmFBZh0BoIqEkKDvrNy13zJRjzbUvdhqNXlrUFaOkaYtricl0blnQb5sfS7PUOk5FIAlci6
	vWr47UJsPCtZRHPE6+M8MpJllXk4yTaRHMCLQUQGpKeXf+p72K602X6yLfMDQf5yd0xH/pZybsf
	xvX5+b6dg3fO1xpIfVW35RFDPsAit9225DM6WCOdY1QqOeI3jC1a6Bgg7QdAB+6CypyJ+QdECUC
	KO6wWuYXMRskO9QwOD/pE++NMHxUyOnIfwYAGcAdcCRCPQ4QGcVypDLXrrygiCeQFlGEzuQtROY
	Eu1DCAWmgUSuHW24VkaQn72QImBL1yEQQk+vmP2oqUzKdKGYK+mSyIAD08gvyA+575sHQuukyjg
	eWAiljzuTgNHlVtSQDGBbr1QMAqLv78DZdqrPFaDp23+ibphXzwxzfdpwPPbhtOh2OXQ23GDqQM
	v93ESEPv/7Sq5ACeUvgEmp+L5wGboJMLzvKn+puT6ZiJaOUVN1QdHY9RQie/HDqb+21Kf4Ap4w=
	=
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0233f98fmr4406435e9.8.1794253339265;
        Mon, 09 Nov 2026 11:42:19 -0800 (PST)
Received: from acer-gaming (121.red-88-28-14.dynamicip.rima-tde.net. [88.28.14.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef675sm9446975e9.14.2026.11.09.11.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:42:18 -0800 (PST)
From: Juan Parrado <jparrado.1817@gmail.com>
X-Google-Original-From: Juan Parrado <jparrado1817@gmail.com>
To: sashiko-bot@kernel.org
Cc: dmitry.torokhov@gmail.com,
	jparrado.1817@gmail.com,
	linux-input@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Juan Parrado <jparrado1817@gmail.com>
Subject: [PATCH v3] [PATCH v3] xpad.c - Add support to Hori Real Arcade Pro 4
Date: Mon,  9 Nov 2026 20:41:18 +0100
Message-ID: <20261109194118.18127-1-jparrado1817@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-204846@kernel.org>
References: <sashiko-outbox-204846@kernel.org>
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

The HORI Real Arcade Pro 4 in PC mode is currently recognized by xpad.c as
a 'Generic X-Box pad' and works out of the box. However, this generic name
does not match the actual device name, making it difficult for users to
distinguish this controller when multiple devices are connected.

Tested on physical hardware. The proposed change works perfectly as is.
The MAP_TRIGGERS_TO_BUTTONS parameter does not work here. Other arcade
sticks use an identical configuration, such as the 'Street Fighter IV
FightPad' and the 'Hori Real Arcade Pro.EX Premium VLX'.

Signed-off-by: Juan Parrado <jparrado.1817@gmail.com>
---
v3:
 - Updated commit subject and description details.
 - Fixed metadata and updated patch version history.
v2:
 - Fixed truncated code lines in xpad.c.
 
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 810e52782..2567ea3bd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -255,6 +255,7 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x008c, "Real Arcade Pro 4", 0, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
-- 
2.56.0


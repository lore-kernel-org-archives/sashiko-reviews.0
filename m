Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254331;
	b=Wrp29vZiRJuxGumWLcnTSwmcN2GN2w8DsF5v7aurDjRburWr5Y0ammGtBOpwUvfSsQyy
	 Ls36HW7BVVXJ7vWj1PrGQAQgWzg60s3pbbn+9BhH+8qP7YA4oq0PLVAS851nbnUYtmCti
	 uN4lPddOMlSz+W3OcPlthTKS5K6c1BeozMGiNGexAlQjyMG2OZmxutJzIeeQ84RkvGWV2
	 3e7/HYd48mUZIsbb2BbQVl1emFsksTWRvXn4lP7JJuEKfUUWyrd51i4T+LNUPLVjginKS
	 7nsUeLzhWEkhS0unVcAm2hP/e1aujoV2VqNic0F/SkYKHOtPdbRS6Jb+GFpy1peiMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+iyECRctbczd6ccDWJllCZGndv7fKJ3cecECSIHK5nQ=;
	b=tJGYi8zkJFLHARv5HxSbbC3+q7T+dtymJq0kQ3LiUxxKrxn1JBB0xliTXuL91x5KLEX9
	 fBfF+WlFh1sX8oiPgsAdqJYG4V8ER+NhaEy12KIj+0Pus7zDhRUBjGFXEoJ1JP+lr8KES
	 v98QYNSAuZjxRyWwz2UDT4InHsJ7yIdyWok3WTy1EHRqrYBn3MEOhlCPLQcCAjQTzYW4F
	 ELAiq9eDP7lOkQiV090pFQJ6V3En2c/PwSXpJrU5rrd3q+tL2XcEdEEl8gJKYOHk9CAie
	 geQHyXLrKMH04hf9HisED2Vgk812f7648/lhvCjoGNX//NQytQy8eK9QyNSm+8bzG4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZPd/7H1N";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F703606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 19:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F703606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPd/7H1N
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so854088f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254329; x=1794859129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iyECRctbczd6ccDWJllCZGndv7fKJ3cecECSIHK5nQ=;
        b=ZPd/7H1N6Sf/J1Gl/PgPjU0NTPSpLOS9Ta/oYz9RtZAaqjPUbPb5Mm21Q7y5QTO1aO
         btxE6vgHM948oPrEdBGsXewbWnAU2sJIa7nKFS/s3EVzGQ3HqNzHpLR2vvBlsCP4bg9X
         +7+I4t4fnLeg4Zrf4kuaqQCjzvIo7JEGmjpTmcQjWvr63xGW6XxYuyof8W2CbHT8cUl7
         sUshdiZlF8w1Ape27xSER5a9Is7DsqhqhGixQPHtIKfObroP+LnPaXDE3zTmYJkyKjzM
         n37kn4/r0MgTZn6+/rFdbqicNuQO/n7g9FnDahFMPhXJd0xbJKL6RlqzToblDxHet+aa
         Nedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254329; x=1794859129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iyECRctbczd6ccDWJllCZGndv7fKJ3cecECSIHK5nQ=;
        b=icdDycNENxTnAN06RtWpGHh8QgsCNnfRDNzWfK7io9sR84wVbi8imJjoLSMQDqEcNN
         jbGoOcA9EvZuDiIXOvZKvNDhUe/JKr/mioObE1BgmleTHFtkMWboV6dYrWi3RuvWqEcM
         ENDyRxU6InAtm5nVXoM+ztwlJfWb8oou7oHtnLJbonrFx4pMrUwYlHxf7avJ7HEtB1XQ
         7phM3fiyOfJYr0+mDJjWiZsKiy8YbyuOs09r59N2qeoVQOzIEZS1YCBey3VCuCTEqDZW
         b2cCoqd6Ttdw+fW0iuYYDg5fDI/qzO1Z3D/oBNdfgbuCSMiuZoIaiPglTKTH9pMaGG69
         ZhXQ==
X-Forwarded-Encrypted: i=1; AL+hErEXw9s2cOQ7Ql6P/JzZZ3gLs0Z5Axni55VNuEKLP4eL4oAjfZNFSri/nTAwET/I994G/i+yNqksjyd9ePgQIjw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jIA5cYSkBaFllc2Pyncl8rgtWeQc0ErdHcz79rZT3czaf9VML
	oD2GD0TZkGuHlDMlJcZIDuJOuHn0mdhW2PN8s68kg8l7mjms7R26Eg2+
X-Gm-Gg: AYBFou0ejUfk/BnjHVZXMf1vorSkJF5II4M7MP94kpemYDePzYOPTLXLpjhdfHRL/TS
	u+UBy/YD1SK+lpkuXd8t8AyVK5Qwzj+xpAG+ecjUN6wddwUUl1rnmszi1GHFnjMlKiPJEsQQIJ/
	oBOoWM/qSPqVNvPP/SP6brK0SAHwDEhNzIe9PdDKThBYBSHX18vrp5/McDVrdsvIRTWrxw5ZJcw
	l2f6y4J5nFWtjUckacB6sx6hp8yIQK1Lo4DCJBjViDvS8UM4ma4UfPBwvwUiNHCd3FjyNROZ4Q6
	07kirRVp7i+ebya0EJRXZ0976Yy7yQUgJwH25aQjOlcAa5Nvb8f9u7yW092h6YZd3w6illIK5hm
	z6PTK2/0jzFJQhK/GVzlU/yQ0I9qIyKq+aCIuw5ob+OBJQystRMPeEY/G6ftaOg7cSYjUxJr4GY
	7RfxjPNAVXvGJkOay+CN6fnZJT3N7mkiir1Dw+jZlJqit6vV2KIhBYq7qORJ3Pz5PBzoX5YRgq5
	XkJYJEg6eauAv3mQ9CIGipXzHKi6MdTKH+le6TVnvb8AgHVA4OTawdZqvYPyj1+883zCoI6592l
	rB7zHUU5QiE9DvDkGJB+ca5Yd9fHkmchTgiO+IpftY+ATUWrqI1AW1Y1zSsOeoMqERkq6vYMBA=
	=
X-Received: by 2002:a05:6000:24c6:b0:490:411a:1eed with SMTP id ffacd0b85a97d-4983105fa73mr947073f8f.39.1794254329550;
        Mon, 09 Nov 2026 11:58:49 -0800 (PST)
Received: from acer-gaming (121.red-88-28-14.dynamicip.rima-tde.net. [88.28.14.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm792446f8f.53.2026.11.09.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:58:49 -0800 (PST)
From: Juan Parrado <jparrado.1817@gmail.com>
X-Google-Original-From: Juan Parrado <jparrado1817@gmail.com>
To: sashiko-bot@kernel.org
Cc: dmitry.torokhov@gmail.com,
	jparrado.1817@gmail.com,
	linux-input@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Juan Parrado <jparrado1817@gmail.com>
Subject: [PATCH v3] [PATCH v3] xpad.c - Add support to Hori Real Arcade Pro 4
Date: Mon,  9 Nov 2026 20:58:30 +0100
Message-ID: <20261109195830.22156-1-jparrado1817@gmail.com>
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
 - Corrected device name in code.
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
+	{ 0x0f0d, 0x008c, "Hori Real Arcade Pro 4", 0, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
-- 
2.56.0


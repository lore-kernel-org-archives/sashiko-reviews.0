Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6A1E3DDE
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783990230; cv=none; b=gmd7A35cNqPKQ6jaKH0O76ReN7aQfVCBjNUAutwslL1GKJzUVCaBUPkk2pOR74A5WGULMcSBKYvJkoMsB0FYXpIXqDcT+lSpRqe7hBu1Fs8lUm5NiGvalZDmpdKrexD0g7JBsEDXZkuwna42HdAYRXk3+xDmaZo+hSzMako7svg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783990230; c=relaxed/simple;
	bh=plDsVmvzslVKcZiR15sqtnvWu68bOdQTPFW26Yt9UOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFn9TFHhcoXYkgyZcKdlfCgbbvZNP1ZgdWAVdnIayR38nB1hRZWXvr7BS4SK2aMvxTKBsQ+8s6G6SGz+V9wnZd9H5tSe0PLqmOBtiCfPYV3N5s/OW3ViL2gNUN5WI7KZKDYTthx8vgQSjIL9niY5MmYMK/OGJLBrKqcvdCpYrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC4G+QtG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC4G+QtG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c62764c7cso4218831fa.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783990227; x=1784595027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plDsVmvzslVKcZiR15sqtnvWu68bOdQTPFW26Yt9UOE=;
        b=LC4G+QtGv5XijyPiRZcfuex2P208SdLwHYgIdY8oGlz/MnhxvKT7qe+xbMuVztMnGJ
         5lu3xkweoLfqOmxLrOKEVa7MGFcGUl84rHUVd5b67ByJF1r9BSKRDrMrWnH41MOfwmfq
         AwR25v5s9yOFhSbj7ydBlcC6svp7VXjrOPt/2exoolIZvbUL1ECSIGZ10LxYW2ATn8nM
         x9Mb27Qrq4rdlKvHCEaU6m0hsaPJIOKnfzZT7osYH2XTPvhzDeJoPfBICwH0kxhOlKSm
         ip+A8jzJscNEcgYBPoxCM6CDBt5pA/BvgIf9yB2ZU3NLIBz5InvWeh6tEd9NslXrpoAL
         nYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783990227; x=1784595027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plDsVmvzslVKcZiR15sqtnvWu68bOdQTPFW26Yt9UOE=;
        b=Er6eu64kdcL6VsmHCVPluQ8ymJIwGzSAqA1CIu1Ki7I6/PXUEejUxH5Rc4+p5bTl+C
         XDReiV6F+xy00Na4WNWAJI77PiZwY/upIWKDQbds7Hexy36TLVLOwFR/9fIfbYgIee3D
         xsdKSH9ughPApbyvMabqwx/Nf2wAVsnZUAUL2COozWvFY1YaCe4VgHk6JTclwxLklmdM
         tXeBRlQoWq9eRhL3VOKKnFSujtz+UXSluA9BazLwld07TDDIbqnAJE2+JeOLoEJVDE2c
         UugT2f9D80zxLO1flwcQfPnN154hCLuqes06EeRdw5txDLykY5hh9rNSj858xjDXDJrM
         YLOw==
X-Gm-Message-State: AOJu0Yx2KQE2EBYAzvmGmL1jz6VYYM4wzLbj+QeZcbtEyc7ZxO+ud1oZ
	LcWfyGzmmNl5ZIZKD4ryLudbYq8HponOQsr6/zRlYyYlxVY4Lxv8zwzowVK/6dE0
X-Gm-Gg: AfdE7ckhkMb4pCyBOyHyp2K9Odi3GvWJFFQdARjVOfSNIB7rdUjYr76i5BjFnjhVIq0
	p7Zs9N8e0n8xD4qxZIlFEwmJWfZpOCDlnxATzdA/Q5HmMSVhemZRsYTUx17wJinY+aPUFW5w5E2
	GXt7uBgdNBRzv1Ve4LGxrev61vScYsUFjryTCrrVQZ96hBX1KxZbDM3Uda34WadJ3MtnT0zaSkw
	7reT62n3rzYOPYsthniVutVQ6DNR+kqNmkRN0hF5O+HoBUhgCKGljrH3G+NmYoUa1gQyyyzrACV
	Rf4iB5ntY09tGwSaZjoDLuBk6hgLKz086FagBMK9PHHHFnSC7Ow2lq+Giw60rJmFJjqNiVm8SRl
	9wkYk3KaxvDErCbpYNXnKrz/3L4rLN7xr9UAjMyPSO2Pj5mfartke4QcVIEApmfl46JlCAJUlc/
	Ael7UFO5XFH4r6gt9ACPom2himmdqGp3UK2HEP+1aiHfi9
X-Received: by 2002:a05:6512:1418:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b023d02863mr1994653e87.2.1783990226529;
        Mon, 13 Jul 2026 17:50:26 -0700 (PDT)
Received: from fedora (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa60e4sm3198597e87.60.2026.07.13.17.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:50:24 -0700 (PDT)
From: =?UTF-8?q?Erik=20H=C3=A5kansson?= <erikhakan@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/1] HID: logitech: add Bolt receiver support for Logitech HID++ devices
Date: Tue, 14 Jul 2026 02:50:22 +0200
Message-ID: <20260714005022.472109-1-erikhakan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713201201.391538-2-erikhakan@gmail.com>
References: <20260713201201.391538-2-erikhakan@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the review. I don't know if anyone reads replies to the bot
review, but I'll reply just in case.

This looks like a pre-existing teardown ordering issue in
hid-logitech-dj. The Bolt unpair path follows the same kfifo_in() +
schedule_work() pattern already used by the existing DJ/HID++ notification
paths.

I agree that fixing the remove ordering may be worthwhile, but I think it
should be handled as a separate patch because it affects all receiver
types, not only Bolt.

Regards,
Erik

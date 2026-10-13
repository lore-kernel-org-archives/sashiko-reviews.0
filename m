Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9762397B1B
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878190; cv=none; b=gSNjUA++6Q/Tdoje3aRx6nPNvzVWIDA2MtZKBkb4EZOD8F0KUM/1pp+U80LLA4ezvyNrIPjjGXU3bc0ruWS/I6TQTxQbJhExHR/fapli+9c1vKlDB8qSzqKxRWfsJTl2RfwD4xtIX0HfbZERug+x0w8d6XC67aTyaVZVdzRdH5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878190; c=relaxed/simple;
	bh=6Hw6zOizikH4nU5MtOUJGtJVcNg17esB1LQ9dVjUH4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLGKmjiOlcI8NcgjSDg1J3TlavscQvMJ2J4JAnHt5sj3noWKvo+2TDw/4cDVNu2IuE730UHVObyGrkmBHUGtVdD+M7jJE1IF8ekb3K228wG3Xx8GrtTIIOVMF3JG2IftSKSL7ExCS/k2jpnUCbPj7a0AmS83Vq1J/Wz0MROHNvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=WUPGg4Rx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="WUPGg4Rx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8662d5e95so14247425ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791878189; x=1792482989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=WUPGg4RxRyZ45kO6c5jIqJAd3Ok+M8ZwSq/wjAFbBYMO/M4+EraJGhPyMl5GLyQZrT
         Y0Yx+qAE7Sj6BJj/9iUlIlt5EpH91ZqrYNBNwRiw+IOQJZs6IvgRwgFG/owskaDfD7iS
         menGvuU0teKdG2jJaszen8Ll6XRh9aj6E3vc9QlSFx7OjaPKwa2RV0SU0hiEPWnsSmCp
         yMKp1mdw3fDanV/FeKKI5VB7o6NfrgnDuatNBndfdz4amJ3csmI7ghpajyBa33ZaBzl5
         rLW646qyXoDKgLbhwz97KWSRG4bqvJSzBXBotrfGay1WIktnPLQQScfeaVkfsbFbbE5W
         Lu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878189; x=1792482989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=Fv37jtg6j2c7lpyVBOXqSFPOkvzDpwN4wxzMnbQZ3m6T7DQAvfapD5eaqJcOy3Ahqv
         MwOpUwy2iZmmytlQCaU3oxFGtImPgL5ElkTCB8QtrOmriRdPG4lZzwtgWyoXMPdNLblU
         WYz6nMbeVAAavSkAA+9sI8n5AxwzZ7FxdofzMqckGjH+U0i2AUAgcvn3hlwiVVPMRyV3
         ZvgEVD6WnIwQ78IK0A67YPSz7kxtVrHCG984bfccPumzrLz3C4NEO/BauxJ5ZjsQ9Aj8
         mn/iqdz9dsMBUDEb3uDwC9lW8ZC85qSBvB4gxshYnzsb5N0PZjbofb9tWtr9kp8Dd9Hl
         eqvg==
X-Forwarded-Encrypted: i=1; AKwUvBzYspAvwQ9uS4wOLm0MCcezfZ6ENVxZBZQIG/sgdT344PoMluRk5PImjsFEDpIBGlfQF8d1XRFmWkYBunDIvNo=@lists.linux.dev
X-Gm-Message-State: AFq9FYImH7V2yM/JqHY8W4qYbkL6lykQrIaN1JZb7UthGtS8QdlP4Y0j
	m8UmIV41MtAt3dgXSsmRMerMOXYdj3WBGr5mZhDQtXHSxhtpg/4T0zhOTbmBYej8r1g=
X-Gm-Gg: AYBFou0y63vmekuCMYHED4rBRvEP1AIm/XNEiqzpx2VhlRULu28lR+f0OWMoSB/NfGn
	2UUpjNO8xafG6dm8vbXyzrsSV+MPOSLx2fp+OAi8Kgqq44YPwE/vVepzn5cyoo3V9IaviAG3M7J
	m/6yKL0nKHa1Jv4kKIDmFpzt9wX03yYMbaBVWvB4HLpw+0DNYtkmRJ3OYe/q9ikRzjDAHeY0oQw
	nzcfZ9fgbUCOKVITQVF76AfM1y2d9NcblCYm5ybYz/pRDR9yl5jpXATsgg8k7Oyvc+0s/lCY2gd
	jXUeuMDxUbdRgRUN1b4TMCttFGuuKbkKpb0B06Ayg/QNncL/EAl47zFIGLajkm/RUtPEys3vsbs
	mE0tsfs24g9ygjDyWLk6I5YDAQdIUPP1UyFkpk+6wUWsD/+K64e0WhZI964wtympI3O/LF6WP/4
	i3S82aTVPg6sf0Hh3oTJRsfPklLcDSDiVo8jGqxVnKTqpzj9C7o3AJoWDQ4YoiOJ6I33gCm9eGH
	0nMbw==
X-Received: by 2002:a17:902:e947:b0:2e5:9923:5582 with SMTP id d9443c01a7336-2e842bc0a30mr98712345ad.29.1791878189071;
        Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm52420885ad.63.2026.10.13.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:56:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 16:56:15 +0900
Message-ID: <20261013075615.2940598-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-169209@kernel.org>
References: <20261013073328.2936318-2-yhlee@isslab.korea.ac.kr> <sashiko-outbox-169209@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ignored usb_ep_queue() return value is pre-existing - it has been that
way since the original c52661d60f63, and this patch only corrects the
allocation flag.  GFP_ATOMIC is required here because bot_send_bad_status()
and bot_send_status() run from the endpoint completion callbacks with
interrupts disabled; GFP_KERNEL was the bug.

Handling a usb_ep_queue() failure (completing the command so the session
does not stall) is a separate, pre-existing issue and would be a follow-up
rather than part of this flag fix.

Thanks,
Yehyeong

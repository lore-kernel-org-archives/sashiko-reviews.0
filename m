Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F24D9562
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645765; cv=none; b=uf4BH5SBq9ezRT15R2BCSIkjN5uPoF0s1Y1Wf/+4DqrzvOdFWyKFC/H7B8ictror9TnD2RlLr3+gGEATWBoUbclSo/LTdTzL4o3d8KWBvvJCP84WzQkJbLiRi7MPJ8bpfGbhQTVkTiSz66GEWZJM8uGEdmwUGLqK/fWG0e6vnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645765; c=relaxed/simple;
	bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LbLxn5u2Zb9UvOuRPFbsrOOf/auX9xG0zqnobknEGT/hlAv6f2AydNR2sOwT9mdLNqWDqYKDhSP93GMsos+1Z5U6EURSBDIhtVjCWkNBugDpHfUOeaWtWG4NPT8TK3/N/afmPmpXYhYMuXUv0Mt1vfBPd7w6p449w5T4jcC4qbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAfudJNL; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAfudJNL"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so537266a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789645762; x=1790250562; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
        b=WAfudJNLAESDFqGLh41H50NnuSBb3YU6fiHGsEvYtZFdjcT62IOMs5L1lkE6K6geCd
         xwqtCrfm/bA7+WQWsOx05P+4yTRX9knyxmXlXHAu0oTJTs/1tFF00f5OAy8Pu6G2mQ4X
         hqPpi8kvMSCQDLx8qub1OZYoDvT4cCeLAY21LkUEJ0jMySISrma8hiKeF2EMTR6Ojq9P
         I6xZHQyngNhV9GN35GOyiWwIk5O1t/rTBmcv0HNRPq2CxdhrhGny6dTCwv4gXgCyzxSa
         byWi4ipRukSDVSsWHIITbGxmlq5sUaZipaRb6VrPPe6a1D7vBzBgBbg3j5HHJ8zdDA6v
         gDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645762; x=1790250562;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+mSIjNwwPWCAJ+fSw8AqoOhMOv22uDk+npErG+nkUo=;
        b=SOpiXFjqBoX7UcqHDfVrPqnW9KAefJivJppktEOIzD0ao1VqF+ETcler+eWy9+gc8B
         D0Cy6nhnapog/WKFDxpqNsbZ81sPpV2MkoBwprbGk/P/jvzJ504cCpknsKPG1//Atijh
         vaREC6AB+XZHI7EPvFbt/Eg2K3eoBp2kisHNTHsX2jVDpw+9JXmdPdu34351Wha0KCk4
         3rSjlSa2HNT4E9hOjOOuR/I/ptoSw+Bw2xfglYuUhx7s7UrCxUx32e4kBCdOTIONqg6R
         WvPQpIQ4SU/vfN/iTsAo8B3YqY37dB6F7axOPeWPY0QjG9LgfTXzJjp1gnXWg4bAVLqj
         eQdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJjaiYsN9y2eEimR0mphyC+P78C8r9sABCT3LhIptth3SNVPUOz6z3FPlUA/pks2FpLhRKgYhv5nkkBzio7CM=@lists.linux.dev
X-Gm-Message-State: AFuF++l76UeJPo1My/uLz4Lp0q+XgQcIdUHfEwGiCKu8R0zeMwBuKjkK
	cEj+o9juNz+u9Xe5mZz9aNdrT4REQjcaVbgpVKd+iptLmxMrfbiObHWV
X-Gm-Gg: AYBFou2FjdaFxVeJXeSnbHS6kYwGfztXzv+Iznmq4/peGQFkMfEUb1KBuTOHurcZkPO
	Dd1lT6FlZjHrSthmwaFWin4orNKBGocxQz3doqfz4omCb/siC35Yqo5V1l/KZUEzEo9xCh42M/Y
	cw+k71WccDwQjr+Lit7E7v7GQJUboYFIP8kpo+BBygHZ/DqpP9NGKD7hluhNoRlM8DY6szREqL9
	jeb78gpmLXAjeSqTCsV1rsLpYcLmv1WoWM8QIyEkMGqntTiR1XWjzvIwyXQ59vZIla7nvOQDkEV
	CxOfWn97RkofsPkP/0672RtmmGc/mQ8ucgJQWrk2gCVWXTXKGfsHMq4JljfJkit11m9tL94Y2hz
	csFLd7EVrKUUEh+UP/hdTyjSToFBt5YD+R/bp7ShlGeirNSCB6il5hnEUexJqAkXu3zODOndc9U
	+yMtrJ9dn3ePTHPhemNgvycBLoXyNc6z70rFr2xz6IzZxxWaOoVHOVgMBjtQ4QvjlLZtQ3SQ==
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39e1df7d64bmr13875098a91.0.1789645762177;
        Thu, 17 Sep 2026 04:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39b0399bsm1178502a91.2.2026.09.17.04.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:49:21 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v6 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Thu, 17 Sep 2026 11:49:18 -0000
Message-Id: <202609172115.ReplyLeeR6.lhw@gmail.com>
In-Reply-To: <20260917112840.GJ1605367@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com> <202609162200.RFCv6-0.lhw@gmail.com>
 <202609162200.RFCv6-1.lhw@gmail.com>
 <20260916143832.520721F000FF@smtp.kernel.org>
 <20260917112840.GJ1605367@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

This one is the same false positive as in every round so far:
kzalloc_obj() has been in include/linux/slab.h since v7.0 (line 1152
in the 7.2.4 tree this driver builds against), so the bot's reference
tree simply predates it. Nothing to fix.

I considered switching to plain kzalloc() to end the loop, but
checkpatch on 7.2.4 flags that form with "Prefer kzalloc_obj over
kzalloc with sizeof", so the two tools disagree and I would rather
keep the checkpatch-clean one. Happy to switch if you prefer
kzalloc().

Both questions from the v6 cover letter are still open, by the way:
whether deferring the Kconfig/Makefile/MAINTAINERS wiring to the
agreed SCSI transport split is acceptable for an RFC, and whether
"led" should become a LED_FUNCTION_* value or the plain ordinal
function is fine.

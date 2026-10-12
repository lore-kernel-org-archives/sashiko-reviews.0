Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62544B0E28
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819858; cv=none; b=GafJVFhKs8fQymfnWcDNNjJRos/hY21Me51ZVjHTiYHSOm85JK9xqnPuy48jqAeI6YzoL2XGef/3uJfxhI7s83T3Hp6xvRRNra56gx47219M40zQvg90h8dT7cd6xiKPcSl7r8x7RVUZsStJFcTwB0aT2q4PAZeIudYCIyY+4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819858; c=relaxed/simple;
	bh=Q6ojckRBjYD3QiFvyFjmdXI4hG8QuqSOEgoyfAWTMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXTcnXQGLVZqD7icdgkkHciPuFEcMhFP7QaGDpofYhyPg0Ah3oVfvxvmnqW6LNEa9PpOzVx0p5yn1hOnmFa7Yh4IPuLCAZNkv6QRBaKYRgMupysGo+yVQ49IcOniaNzOQja2Ab8YC5IHr1Ncakgz6KQT8hLqFdDzwm54F3ahd4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=yNauc+4P; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="yNauc+4P"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso661212a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791819857; x=1792424657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhzmDkyNi5tXfQXog831HLqTAGZf7SGBLNEnHb+ghbA=;
        b=yNauc+4PAeN21+GCD4/txTERx9G9N6K8oSRrKLY2byFgHfaClDrbgg6geOtFJM3n6v
         z7QW71EVutyfJFLnvNh3zvZ0gyU9M/qAu43Kbi80iLty6cuPLXTWEYXRZrKlmKNUnEX/
         g37A1Uxx2V0vYorEQcq2OS0WNEGFW4YiCx+50Cuc/HweJgl2KsXMvURu2NoMbS0p3BtC
         ACQqLRv+MVfdV4eHyJ7K+6hAn+MIEE7vRav2w3Z+DeuMdeo61yhYeHVl/D3uMUugUeCK
         6XIJAegWaGIhMSQhr2ff95TrytByoBWBjsLtvSUBxCDHpoaIoB00tYPVsadD00MuVbA3
         XDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819857; x=1792424657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhzmDkyNi5tXfQXog831HLqTAGZf7SGBLNEnHb+ghbA=;
        b=QmfgHWetzahOM5Dt5GmWCcXFTaKwIwFwwewrL8IZA3Nx03bH1drtgBr1OeZC1LS1vQ
         423eiGHMcSRWEKJ+Noi1gQLuAgrue6SvgAW6gOGLPu1oWtorpMRhWkYbsC42Pg6CbswG
         knd17DvbLhsoAh2ZGy50eZPt69wvnwLgMijZt6oo/O1gG8vPNWT2CAIbiphVI/mytLlW
         LlKYLr6C5uvjtGhTpuqHkewah9bntPN8lc8zG7ofPHWGlVO8c35kqGWL2x+33hMSfxMi
         0Qr4bynur/GQKA460dAyvGy0k1a17qOsA7z2DiSH/HwlprnFBTWA2UkGw2WWOkEFeyjE
         hHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBytB3X7MsMSL8mQ8GWC2P6B5VEWwAHT/M94v6mGEC4pG1qGuqsnb1UFMwufwjPCrlDdrcGizWDPYkv6rJ6udRc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJSzPoT8d9g+M3OxqDwYIMlrWjH0j2a9/ovqEZbEmHA65iNdwCb
	R+GuC6bLphv+/ykUO+gVD0bSdO7zjHOdZ3Qx84MtNkOaHTRodt/uDBxW1zG3L7qExIi77H+7RP7
	HuL7e91I=
X-Gm-Gg: AYBFou1i52IVnOYzcRGR1QqBQXeWAOOPddkpYZ2RAziQpqRixDzfH3lDlSPEs4RcVV9
	6VnvOMghLTFEeHSSrD0bSaMLx54e2heSbYSHdSSkBfxvUqkO7wY/kZpMCmITkw/r0kheG48TJnO
	UXrCOca/deUYp1e0Cz4I4PgvPYHRx0ONqz/SQALr/IGy1cGJXPBddChg/ZrTvlfJcNFNZ0eRq8B
	a43/JiPb2gOSllkrwoJSfSW4gpsIrT0vah0FY/lvQZPmuqT78N9VEXjiGIA9OINyJqZ6z4NHw9z
	L8eNfa2EzSwuk3ZzbHhBrDBZdXserdCZVKZx/Fc30n3CxiRK/n6iprcKIFYo4nJaJKW0Z8/yG5J
	h2g4m0C7iphzTFYRxFG/1nRVzSP72HrxVS8YHMZ+kUejlTDBelw4yJs2oTiXPik9dwPn9FTZBry
	1oW8tBV70XrNhfd5PbwDmpARveBwrmpKkD6L945sR75u0a2oLQHDV25xywGmPkdCKPaAb7soUBD
	MSc3qXSgxnJ2dtlCg/M7Q==
X-Received: by 2002:a05:6300:68c8:20b0:3e1:7199:2309 with SMTP id adf61e73a8af0-3e171995951mr4822949637.64.1791819856742;
        Mon, 12 Oct 2026 08:44:16 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dc37c2c1sm3342938a12.6.2026.10.12.08.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:44:16 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org
Cc: mkp@kernel.org,
	sashiko-reviews@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: tcm_fc: reject overlapping write-data frames
Date: Tue, 13 Oct 2026 00:44:03 +0900
Message-ID: <20261012154403.2436121-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168243@kernel.org>
References: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr> <sashiko-outbox-168243@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks.  You are right - v1 extended a tracked range but didn't re-check
whether it had become adjacent to another, so a reordered write could fill
the small array with ranges that were really contiguous and then reject a
later frame as a repeat.  v2 coalesces adjacent ranges after each frame, so
that no longer happens; I reproduced the spurious drop with a reordered
16-frame write and confirmed v2 accepts it.  A write split into more
simultaneous gaps than the array holds is still dropped, but that is a
misbehaving initiator and the exchange just aborts.

v2: https://lore.kernel.org/linux-scsi/20261012153502.2435483-1-yhlee@isslab.korea.ac.kr/

Thanks,
Yehyeong

Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F23E51C5
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807380; cv=none; b=Ny82vwovgTLfZizY9cLLTSm5FKn2e1hmJbQQr1P+/TJVxv9JjYA8moznqY+cR0l/FFxQZARmnTss/vwTcxynSQubCPxONqEIQUx9djQHxhrXIKrq5NnTj28LKoK55dwaEU1BJjRXvLNFxU//A1On18x895qSYI5Od521OEjc5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807380; c=relaxed/simple;
	bh=jR668KmHveWhKfzwm/VRHu50O+jFQBt154c4fksmz2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsyrD7gJmft66PLE5OmTCG5ZBhksp1AzDNpbfarcPEM3o4bUMpBVt4Pv96u0Uibp2URMo4M0XFmfO4zhT0y8pG/jKt6KjZ5Ea5XfIMN0OQxciB6mxWGoNtafBCtAC4UTLxsPSKhRWvi4Jf48MVVY/xlo1HfpMYkJbQF+VxTD/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=KsFUKhaZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="KsFUKhaZ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so931437a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791807378; x=1792412178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR668KmHveWhKfzwm/VRHu50O+jFQBt154c4fksmz2Y=;
        b=KsFUKhaZYJgVQNCYeskdXNb8GnfoTromnARGOI/8TOfDUXoRMsNO7c0Yj61OFUnM1e
         C4VXhqGAHNYUNG0uCMJw4Q+oOFIMlSXB/B1Io69SeMXbr/6KrZuBvG3sCWsi0k2XAws3
         lq0EL73ar10BzE/I4hp/cOd52FIx574sDNPawOdJgkOuRWUy3NpqoDZctmv8UrcAO1C4
         OXGh/pgJXxfp9XUH5AIfUSEH0XoMzEFHSUUgs0ZPakoG/0lfVWP+R7w6cf5OCfMN1Yef
         7+2NLqcLKoPoMXwarU8gHElOK0CPdPaCiJX3pFG6BHDBX237+Zbh0JVg693TGMdI/C1z
         0NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807378; x=1792412178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jR668KmHveWhKfzwm/VRHu50O+jFQBt154c4fksmz2Y=;
        b=WWWRPdILR2x0Frg8v4VuNINP88sd670O/iCIHxBrpSrfRIgW9cd3VMqSmrC+XDo2/C
         4W5kXuV+MabFKc8hZQjdJAt1fRAftSSW9X3rCwfpm9J8EowmqhJUk+nYktKIigFHkt+C
         BQaEfW0/kmA8iY0Tk028OY3YXDFAzc2/v9QeweFYsa3B6eItcALiB9LPV/BRLklVbQsJ
         6eXgPMx/cTYN1E6UmbM0yrdd1oQujUcIiE/mWhFtmj+pZ8F7sPbpQVhu18uDW2tmHXzX
         pM87CY1ACCahcJmb5amIFqBv7WAbfAeVXHfcdR2SoJcwZX++sohhZ03TLeI12Wjab3bY
         X9jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMm7FcQugJHU+qMB4wHkt5Gj1wbwPweod0doV+VQKW2b2U2bh0RjJhamige2o/i7fEOnRdvbpeLo/P6Y68vyY=@lists.linux.dev
X-Gm-Message-State: AFq9FYK/9L4fB7QM32R4v4qL9hG75RxUZE29FX0ae/4tZOo10ljNrlgl
	dJRF/xdYVDegPT+J/m1UzReEKKPfplzPv8i5AN+wlfCKzRcQhYW0u/twKFSEDmIh2Zs=
X-Gm-Gg: AYBFou3BEQLOgpRQcGENn7N00xiRhKCXKDn8IxLJ7XH48zfoMaPF0HXSL9TQL/Vrz8H
	bJUueaaR7Dkaf8toFBI2Pd8h+Duv+xM7bHlUlg2zp1bi+QSXZYW5A9OSGBZ0toNWLriyvqVlbKi
	QNsYSBEmI353ZLTxx3cUHoqkq8+IguatBKIhlfHCBlNbNwxM3U8RqQbd6WRYP7LJKuyAqITqpJ+
	JArEbamCP1mReO3Od9I4EHsdar2Iicpir8YwVO3cZodvWwbuh71dv0AK+0CcJvK4XduD1NcWvno
	YnropCPO4cxv9SPXRmL8xAHP7USvorLkLPcBzaI7/FexLjsboLQfLCNSxXRBxG0OLFcoypGppXA
	tTryx5XteuY3F8vIc+0ryQTqRiazJryurej2gnVolzHBQi6AYYDum7+xpQzYpCIpO26m9WMsdC0
	1BcDOIFST6xaji8qoidQqeYS1wce8YU0A4rMKUQPw+HuOYtEjVywmP6xZnUL523AOCPI9kW09BJ
	Ww2wPyNArh7AS0Y1lbMsQ==
X-Received: by 2002:a17:90b:2d0b:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ab3a97a71dmr7873463a91.59.1791807378165;
        Mon, 12 Oct 2026 05:16:18 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0ce7sm17212536a91.15.2026.10.12.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:16:17 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org
Cc: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	thenzl@redhat.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 3/3] scsi: arcmsr: wrap the type B completion index before using it
Date: Mon, 12 Oct 2026 21:16:03 +0900
Message-ID: <20261012121603.2335651-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168041@kernel.org>
References: <cover.1791803953.git.yhlee@isslab.korea.ac.kr> <459990a0367f7268c0056098f6e2631700e20327.1791803953.git.yhlee@isslab.korea.ac.kr> <sashiko-outbox-168041@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is pre-existing: the patch only wraps the index so the first access
stays in bounds, and leaves the loop and its termination unchanged.

Both type B loops clear each slot they process (done_qbuffer[index] = 0) and
advance, so the loop only keeps going if the adapter keeps writing fresh
non-zero entries into the ring - a faulty or malicious device forging an
endless stream of completions, which is a weaker and different threat than
the out-of-bounds read this patch closes. The same drain-until-empty
structure is used by every adapter type, and only the type C isr carries an
iteration budget today, so adding one is better done as its own change across
the board rather than folded into this one-line fix.

Thanks,
Yehyeong

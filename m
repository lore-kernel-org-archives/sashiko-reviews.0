Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82449415F2E
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277580; cv=none; b=lEZSGfFIEKmVDplwcFJdSA8DoWxcV4I4+PSCCu8NOTk6o4e5zpSezjo8xiGcY5fZMI572r1H1cjdTbhsptJyPnHVQUEZxwImLf70sD7jZB32FTWSW2Xy4Jd6VqDUj5dB4CrbGcg953wsWanvZMEjcCMUNHN+icUrhIoXHFxKmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277580; c=relaxed/simple;
	bh=aSeAMMRejQcvgqM/1az9gIvLK17Z1fc2LbbdhiIiGFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OF0YGP13Kp6Gfvdz+OLSI6KlMGFi3SXeVa/phLE2H6x1w/v4UNDtfh9IL7/+joUGqUp4Vojpzf5pzK5KHTk6Y/nFri+tSFriooFhlwgn0JiVjWWQ6L7P9XNZDXhrtrX+f63ZygM6Bh62K0qcFGk9S5+luSWsI3F7aDH/PpgzusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdW8z94E; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdW8z94E"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so895101fa.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790277575; x=1790882375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSeAMMRejQcvgqM/1az9gIvLK17Z1fc2LbbdhiIiGFY=;
        b=BdW8z94EKlzcJCtAA1ym4YgnXDyVuykzvYtXYzE3RWj67MeSdNuufRWcLFVCYF+XN3
         oQa+yHKzwELVPibkfWt6IOMdwWu8lwkYr+1yvd8tQRP8EUh/cTpF2vffmdkdDMVEEbHC
         E697hA8qMpGGs+6b3GB591nBnRpM7m0Ga+FIx/A8k0iHA3G2mDLcK5i7dnAQOj37JHsN
         d0Q+cWlsSUquagftrlHOXKBbHyZLokZ/duHnvPbWrjZZM2l9A8gDPczc01ORWJ9DXuc6
         OAJROGpt4ONqTwk2jkTI049lIOYvdD0e17HcRSy2eKCfQeAE6v3W6wlh570HLQ65+O+A
         HhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277575; x=1790882375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSeAMMRejQcvgqM/1az9gIvLK17Z1fc2LbbdhiIiGFY=;
        b=gxYyLOfzH2fPH5n0vnlWfAmBp42cWZC9uwRzsV+P6n2f+QRnaIWH1uFOGD1/uPySDr
         TneD3JrEX19Ypim5TCblnTABbxEI8bHGzffxNKJ0YJYZbdoNWE2kzPb6heSjI2paojfC
         cB9O18WZNfqa78a3laQhguK3zhnOBVYfaSCgM6G5fmN9j25U75TA1oxTepJzX4Rdhj77
         sGPVPVzS6KFyUGW04ROMxJzaI70mjrpyKBBbyREYdJ4D2WW8bqH9ZcXuPAyrfINFkqpS
         wcPyr3OoiApqHh+bPk9lwXayxOSXBNZShBYozrv57Cy38w72HPksDQqdJD6yO1xseYBa
         27bw==
X-Gm-Message-State: AFuF++kMBW50f2YDdaOzNuHPssYB55zFYcrve6zQc38GmpZHAJ1t9LxM
	0NbfEtcjBVl7CLrPEtH91eU+H+A4IwNA3UpTHQKXJQFa/3pjIKT8jjhsQt4QfyddysM=
X-Gm-Gg: AYBFou06dmm2DpsQIBhvBhS/3nPQ0c7wZGCLwuLg6D1wm/GNAMkRLQjgtOnB1Ty/FKF
	m3MzWhxWTs9ljhJGAKUb43zPt2Np/2P13BznmqoGCJy8lwWc0GbTr5t8Et4GO1GeptDByTIyF1R
	uSUf1epq1Ha0ZK0ShPPGcdmW/dy9WF2G99wSWjh+d9kjURmWKznhqPwBaHXn04Xx0d3TEFBHUgy
	kjW0rqMw1i7KpNWgRM3eyxd2zlawctCP34OwSin9S8VI94tLcqAweamt8BFAdI26QK1NnM+YGr4
	sqoDA4+GPr9J3xelJDI1pY45lWv1lR9FLBorCCGNlEhvdbsHOLTUPwX4YRIZAH9MTmepV9RTbGM
	k9umacLFzW6zEwOjtozKydRyQKiBKBvo7dghjjppeDN1s/VU435YumwXgg1mYmdqGHzabrMSpxI
	d+mKbQPj1Gm+xlL3p9RvZZG2JpmElMEFB4Y3wzzkLfQ7hA555YuTch9McLByQYZ2+9NLBBipIjY
	HbxmgmfHCmnQnMP
X-Received: by 2002:ac2:5ed1:0:b0:5b8:da5a:937c with SMTP id 2adb3069b0e04-5b8df0db9c3mr928965e87.17.1790277574572;
        Thu, 24 Sep 2026 12:19:34 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.131])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c3274fdsm47331fa.38.2026.09.24.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:19:33 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Check that bpftool reports a map it can't dump
Date: Thu, 24 Sep 2026 22:18:36 +0300
Message-ID: <20260924191912.548272-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924161724.E8D501F000FF@smtp.kernel.org>
References: <20260924160732.485650-1-skokovmaksimevg@gmail.com> <20260924160732.485650-3-skokovmaksimevg@gmail.com> <20260924161724.E8D501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Should output be zero-initialized, or should the test verify that output was
> actually populated before checking its contents?

Right. v2 clears the buffer before each bpftool run. That also covers a
second case: the plain run reused the buffer after the JSON run, whose
output holds the same message, so a plain run that failed to start would
have matched stale output.

Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035119067C
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095801; cv=none; b=NAtSiRKSzC1wzjE43cae07R41FrjcM+z1BT+7dQ6cC0BTaCJ6Pl8eRV7xkxiMjXEYgWmypUVYVch1u0/+Bqu5TPqohUm+Cx29dQefBSw4AezbEFZht7QSXgxX8sI5JcKVSH51sZPLYmKSljwqpb5TV42HF8pCoinBGhOf/6ny+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095801; c=relaxed/simple;
	bh=/old4jKRCWsiFjlSdpH+uXgOHrvpMJuQq5EDgBf/RQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vD3+zL2U8clSlbguTfYryBlRbhC2y2FUDx/vZlZRV9IdKSJrZALH3TVFMfsMwUOvAH7buzuVN1vmz1MCjLP17TsJAVHi58mjP4ZyAxeav5MSHBCU7M1OCCMH6Vz3nILabQKGPv8doR3jWWiqPzFMD7DzSgbw2PuIK8MhtrUGak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IArgHiLm; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IArgHiLm"
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d313798bf8so1730125ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 20:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095799; x=1789700599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/old4jKRCWsiFjlSdpH+uXgOHrvpMJuQq5EDgBf/RQc=;
        b=IArgHiLm4/ENAZD2vETfX7onjSUd9mGvYZfgm6dLi9/At2flLU9T8Xz1MMcJ1ywCPv
         JyPrkbM+ffwZjMHWOu9Rf58WAxW/Rz+QIZmXf3emFuf1s3aQWgqXn88sVeJNngX2yC9D
         5kObJpPlSC8P7Mi//R5P/TOV6+NXL9XwQwzZTGKMKmma8o9I8TaTwNCX6H6KP2nhkPRq
         De/fIPoIaXthxXafMCf+Y5kJJsAM9ypRtkzl3RskUYskb7/OpN6uZvT+vqNXthrIIIlp
         0dbM27PvhVMOFnl3JOQ9aIipsLm2z4r9rNaXMEKSu4hhYTGcjFqvtCnHQ5JgEyyuqnga
         LxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095799; x=1789700599;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/old4jKRCWsiFjlSdpH+uXgOHrvpMJuQq5EDgBf/RQc=;
        b=lRdKbqSjmn4rPYVgz0T6Dcu9GZhRdFuI+h0gCbk58HyXDtSbqFPmfLbwjMOIgC2vqZ
         CsFrZ8Kbr9VMpLyF5OvwFVQjA+ZFsNydJ2LP4z/sBX38gibMoeLUjSrANFzr+f2J7UE9
         8QoL3FUdhK8ANjl6+mufwG4YhWb5Y+e6/izrHXxCmN67MtlXBe2ZVNFUGIy6GevARa8e
         gbB3bTdMcRKOcCGah7TPlRS5oGFs1qMgqIL+CIGdrdWnhAgz1VKfbSuJOCsuPT2T+VrR
         0OdyNOlXcQoKfMi0loujQeumAg0KuLRsOJBChv7U3W5h30Wsgrii+A2YqwkxqS5iWtde
         djcA==
X-Gm-Message-State: AFuF++kodj0nbLX5cyEt8Gm//n31YOh420JLi4p0qo1jXfVF0L66Dfh2
	CGAJ1FPFf0bnrzvHlUNBax3uVXc5yU2rD1SEI5oRIm+8ct+glbfwSO5aPmjM2Z5Q8J3Wpw==
X-Gm-Gg: AYBFou0dtvExSYhvdWAXiGU8RFNhKhuVUz4Dz5kdp3szPXwCuJ3lA95QIy2q3LIZcz8
	wTeAYx2JArTZkU0l6hyPzDrGi3JSqwRk4tNPcCIxtVG7PC6zrwj6Hzbu84yQt1F7PwKtXgerXJC
	CvZb0FdB9+MwDTXr5Xh6QV+13BzR5G4Vq8vtqWqh876ith4Y/7QKqs6JrCxtEqe3BqwAn1rl57I
	IauLvJVAMce587YY+CcMTxLTKh24QXSvsgfh6ekA8pPcuxSEoSTTMKjrWSvhPbu9w5+7EeCltU1
	kmRxXofCnwyILQ34aQfaiUgia13rwv88nc6LBTwlHRYkvWeZQjrWXdNEVzpFWWX6PvXtOiExtN6
	aUmGtiRCqhWyA0tB97rIuDhBdLLSDGGzVj729ftNSF/7aS9AvCElPABo5+HOzCabBsKzqpsvA/H
	Dg1/Z3kcdIZkuhHkOU832bRl4m4vFwIp767onZ/tj/hxdfATM/qi1k1SzpouY/xhCm
X-Received: by 2002:a17:902:f64b:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2dd2a462479mr49122175ad.21.1789095799260;
        Thu, 10 Sep 2026 20:03:19 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb73cdsm3979725ad.38.2026.09.10.20.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:03:18 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf v3] selftests/bpf: Check returned keys in map batch validators
Date: Fri, 11 Sep 2026 11:03:14 +0800
Message-ID: <20260911030314.195110-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911025713.AB5891F000FF@smtp.kernel.org>
References: <20260911025036.190487-1-diannaaav@gmail.com> <20260911025713.AB5891F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files run under test_maps, not test_progs. They include test_maps.h,
whose CHECK() reports the failure and calls exit(-1). That header does
not provide ASSERT_*(). The suggested ASSERT_GE/LT/LE helpers are defined
in test_progs.h and depend on that runner's failure reporting.

The distinction matters for these range checks: execution must stop
before indexing visited with an invalid returned key. ASSERT_*() returns
a boolean and does not itself stop the caller, so a mechanical replacement
would not preserve that behavior, even after resolving the runner/header
dependencies.

I am retaining CHECK() for this targeted test_maps correctness fix.
Migrating these tests to the test_progs assertion framework would be a
separate change requiring compatible failure reporting and control flow.
The current v3 passed test_maps with no skips on the rebuilt bpf/master
kernel (7.3.0-rc2).

Thanks,
Tianyi

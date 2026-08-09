Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615B1CAA6C
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265367; cv=none; b=ju7dliYHznzbE0XWvufpKoWOi+eX75fwQ7v1tQIdJwTopehRFqBC6Ufr5ZjOu36uQ9l1AZbi4NdZe7nkhV8mmIViC+5IMmUJy6KnMrWX8TdQpB+fWIBDnUMVrpCrveaRRREftnxqqz2FMbi/1zWivCDKO+t4zTgNeyR3G4mWsik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265367; c=relaxed/simple;
	bh=vKWgmcHfwYmk+WOyH/m/NR1zFQDp05YpYR4cyM855Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di1zpQZMmdjYBBEb+x+y0N0gWfMC4S5UrP/nTijqkZL6e5qjeRLf+T/9Myg3FJrarjXe2AX58FGPq9bSxYYs4tKienQsCXNo8mTUPzXguT/2p5dtKkYuPWpd8tpjJobQI3YvL3lyyFc2ThtunR+CCuqZ+acpIcOAnjBWwFlCG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mim/NfuW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mim/NfuW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8486672f03cso885272b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786265366; x=1786870166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKWgmcHfwYmk+WOyH/m/NR1zFQDp05YpYR4cyM855Uw=;
        b=Mim/NfuWSIfVsn2/KukvGmfvGnorNtVLew+O/NTR9l1zD0mKvvimLu9HPsV1Drm8Ip
         V+Nhi41JWf77wQm3ggglD/+eAmpgPBcFuaQ7M+LMD50AeHBpAL/bZenfjlWv4gIoW0qe
         tnFFqMPZN7XBZmRHIoya2FkeITnT6zZCfJdq12dDpKu53i8iNbMzI1oB3mdAM9AOKBY3
         jI422gnlTzXEVZ9hl6TZLwUIc8p0xbCW99h2fi4Seghdp32Q6HsAO0J4inOuDiWraGq7
         2p4AiUkomiXCkMKodN37Ve/K+QB6DudNkTk+UfKaj2yqNmEWmj1KVxU5k3/yHeR8+0qg
         aDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786265366; x=1786870166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKWgmcHfwYmk+WOyH/m/NR1zFQDp05YpYR4cyM855Uw=;
        b=EDR3yXpwgI3eXB/CSXA9MLWUl1tZgyecjwAHC2FWruZfkQToM4RJk7/wUFd4Ff6kIs
         GHNotsEvxCScO1Jw2iHbTb1TcZCB/SwBsq8qU0Imym+FEknVfKdH4elnpK+MXCfkC3cI
         tHV8gf1s14/nJugdVfvMBoV1NhgdM6xJ40qhxxSS16nYk2kQYPxnGvTnH9RrFfLqKUVE
         8JOFQs7vOcDnayJ24LOrY8l+RZYlClkcfGBiaTmgnYagMRE2j+/YdlulvOUC0Q0rEG2+
         60FNWt77FEGNlFjMczeA4ciinzPucVZAoGZFAMTAAIJTBvR9XpdULlvLmWdF+knp3GJZ
         ItOQ==
X-Gm-Message-State: AOJu0YyR/Z+UMenEMgL05FUvzdAxZ+v3U9AYWuAcOIHlr3A1f8wndLfv
	RwW7Sfzdrb1vbQiiUczTdeSeY051MmBPgWxokAM8A+7J0o6siJp8ZY/T
X-Gm-Gg: AR+sD12PgbKgMTuyVnsmlugEMgZr+RBcGXxXKTYqebUP5amEl2cnFQ/ZCpNOwNz9nyc
	L1//XJUz56gb2K2lLWu5aJXIMTa0nCUEREtUOZvVYfVooKfPxQ35B0Dm9qUR0NtpY3dHB4jI/y2
	/5Q9/9faWCup024kzuWEBy9DGIUu/skvLfX2Q6V13FT7dIn3gM8/OnNc8vkBiGFnJzL6DaI+2lU
	K4gkwnFRb1t6vmqtN68D+IG+JwUgmY003JymeWif1ZCD68/qweA1uPLOBpKkrKSRoKxZkAjAQzb
	cedCNCOKN6BdvtAh71pPx6I0Z3xl85hEtCsx76Bzn3kZi9tFDiTGr8Qysk6dr4JxYbC1NDc+Qsa
	o+9CavJg9OP0zBP09hL9w7ysnUnp5Zn+Uu+hS60n5F+dP3hjppw3gHE6FvTr0IbLThvvbk9VRGQ
	vpDiWJsZs0dQb0SZ9CjqWwRCRHJ47RUtFa8VRpKnr+PjkTgNkjxtAHxV+3B6Y1OgbqbqHF+49p2
	Z9csdmSYrY3zJ0=
X-Received: by 2002:a05:6a20:7f86:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3cb85ea363cmr32830018637.19.1786265366126;
        Sun, 09 Aug 2026 01:49:26 -0700 (PDT)
Received: from volcano9dee-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb877b4sm32757823eec.19.2026.08.09.01.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:49:24 -0700 (PDT)
From: PVS Narasimha Rao <venkatasuryapala@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf test sample-parsing: Validate PERF_FORMAT_GROUP values without LOST
Date: Sun,  9 Aug 2026 14:19:03 +0530
Message-ID: <20260809084903.23914-1-venkatasuryapala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <anQeWZD8J-gHMt_3@google.com>
References: <anQeWZD8J-gHMt_3@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namhyung,

Thanks for the review.

I reproduced it with gdb and confirmed the mismatch: the values in
do_test() are a plain array of struct sample_read_value with a 24-byte
stride, while sample_read_value_size() is 16 without PERF_FORMAT_LOST.
So the synthesizer reads overlapping bytes, and the test compares the
same garbage on both sides and passes.

read.group.values is expected to be packed per read_format, though
evsel__parse_sample() points it into the event data, and perf inject
feeds such a sample straight back to perf_event__synthesize_sample().
So I plan to fix the test input rather than the synthesizer.

I'm preparing v2 and will send it shortly.

Thanks,
Narasimha

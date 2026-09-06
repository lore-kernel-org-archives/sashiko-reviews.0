Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518035DA69
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677954; cv=none; b=Z7j7AYol8d4reJwSpAVG8CEB73ZLG0+rMEceqtnNXCu8eLAAnREN+vVa0DCSK9QTph2iMpyb6JrScepnioGkMKG0OMhE+61eSQxVAzG/TReC4b3xf2v7qr3I8QDZj7NCY4YikfjSTNSZzvWlHeR4hDx0gLzg3DTEk0CbxTI2MI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677954; c=relaxed/simple;
	bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU2aji/MrwepFjV4U0QuDPiuLdHceWdl13+cnZoMMSUz1CxuLEUm7mlJ5m36k4oP9tiUip2ysTnABbtRBobFivx+Rs6RfB3S0NZS8fYoVCGkAJtEFFYIH8SVceLMhczy1jczLh4QVf1Upy3qEp6TE579P0oLzJZm80Ddelp8JZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzqzvNVz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzqzvNVz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39b52169dacso346316a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788677953; x=1789282753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
        b=CzqzvNVzyHlGBCFQTNY828k3ZBwNk7dvEonLwFFw/LeS0D4DiOdsXx9kEsxuhmMzsx
         P1pFvJ3DZJvTmglvIv0ixGnWRVMsWlvCvXPelEnaQb+NGYMW9GmEzHes5HQlJeTo3Fmh
         oGMF15Vvv1oMDFTfKvqo9tGC0nA3W5ZBMJtz60F/TWm6tTpRpxqcAtEf5vUoAxz5vwqm
         h/iylquWwsSopY6ALxm1FAcIiUdy2UAumlTKXDyICygBXRA340RIOuHlEHc+9+9WdwZj
         h5BuboHia7xeyMNXPnTcSxlyCTQUFdSEoCu7dBDSBd36nOY+Kc9jWWhm3CwAyd/WtlpU
         9+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677953; x=1789282753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
        b=GvV1x1vNV6NTrhU1yP93MoiM6hHlYl+hTSBvKvl0MEhN40gnH42yjcILQ1AVhiuSuX
         Kw/Obs3gQ4uuuLhV0BvJM0K9aZOR7Ud5TX2/YcdcauJETZM4L4a6YXlyyHfBH+G+PGuO
         4Prn2LAB77aIV+k25YZ14lU+gkNz2f7ZeecvAVnpGhKJUeW59jBkAhYiMjO6gNkxwE/o
         X6xfIh4pDW/wwIpHxHCMXjslnwSFAYgt+IaZvk6BHE8Qfgg90O8jPTLJAf4pqw3ypTAy
         Uk/NLn/6epSxdHT/1zu1BllGqHB6OsOQVVzr0OQn7pNHagBjKt0YISQv/pKX7ldE7R92
         i0CA==
X-Gm-Message-State: AFuF++nrymDQpmjW1v+5IRR8zUpMXwDCdr2CfnMdX+0S/AmzlU9+KoV/
	kAlrdw/oqFf8kMUg2l4Wx9it6nZQIdxl09gBlB5R2nXAUXVyHJAmaoeMS6VcjJYbCg==
X-Gm-Gg: AYBFou3XbIlWpA3DkWoy+QEzJDUwU5DrmeHRhbV3ZhGarasvIH760mepsjU/Qc2ducL
	k82mf9gXTsC5VeLsY13fSoTflaGjpZTQDsP5UPUZwUSfb3oR1h0ch1ibFqwJ2CcXxVsgrSodPHN
	CE2wmYMiGIDHWFfrWcp4wPTHKccucFyPqG+IeNJ7RsoeSZc7GxOgEAAACffscgbtjwJrwdh8fD+
	hs4ZmqyHVAY31M6G3vXFm/wx71GY+Qa6YmadEz7xYpnkNbdd6S7W40oTkePsB4YgqbBqZUb47WU
	7B8RZbnd7oD962lJbszT2/WLFBT4rznvOjAqKPwE0UzfTncn5PcuR3/1UlEZppgHzbc0VZW1m00
	3HZj+vzgTYw24s0IXsxyzTnH2O8rGXq+DeIknk8W/MKpBmhtE9FBd5nqjroZKOD0nVfN+lXuDEz
	GARR3cMwiEfu71n/mAqRBkGdlPiIqRBo9XqDGrnS5plHokotJ3AU4kv8Barp9BzwWv4KS8698qU
	oahntkNH+SCJn43YcejhFIV8hcx
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr23047016a91.10.1788677952877;
        Sat, 05 Sep 2026 23:59:12 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm13604739a91.10.2026.09.05.23.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:59:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] function_graph: Use the saved entry's size when reprinting it
Date: Sun,  6 Sep 2026 15:59:07 +0900
Message-ID: <20260906065907.1495913-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906040248.3D46F1F00A3A@smtp.kernel.org>
References: <20260906034406.1335316-1-donggeunyoo.kernel@gmail.com> <20260906040248.3D46F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 06, 2026 at 04:02:47AM +0000, sashiko-bot@kernel.org wrote:
> - [High] This problem wasn't introduced by this patch, but state
> desynchronization when reprinting a previously failed trace entry causes
> the current entry in the ring buffer to be incorrectly consumed and
> permanently dropped.

print_graph_entry() does not always return TRACE_TYPE_HANDLED.
print_graph_entry_nested() returns TRACE_TYPE_NO_CONSUME, for the reason
given in the comment above it, so the quoted branch is not reached in the
nested case.

For a leaf, print_graph_entry_leaf() has printed the entry and its return
as one line, so the entry left at the head has already been shown and
consuming it is correct, as it is on the normal path. The iter->cpu != cpu
test is what separates the two: on another CPU the head is not the return
of the pair just reprinted, so it is left alone and ignore is set for it
instead.

The other two are pre-existing, and I looked at both while working on this
patch. get_return_for_leaf() returning at !event has already consumed the
entry, so failing there leaves data->failed set over a copy from an earlier
pass. I saw that once in about 30000 replays but could not pin any output
on it, so I have not sent a fix; say the word if you would rather have one
on the reachability argument alone. The static on ret in
print_graph_entry() has no reason to be there, though I found nothing that
misbehaves.

Thanks,
Donggeun

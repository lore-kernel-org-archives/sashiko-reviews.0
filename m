Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA008519919
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575540; cv=pass; b=kmJ6s6lklKXRikhn52FHURtpyK1ZdokQajnVROmUIIdccMK0x82EO/kkpZQMxlQ/s08+BLsVt4YSdKB5NozuIicSU8UzkdgRXQ0YlgrKsaMLt+Xy2kqUcvYImeus54ZNhZcGkipC+PeG0HcL7XQLQb1EY8o+galuuwfhs8LFcHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575540; c=relaxed/simple;
	bh=w5MPTKLB/ozka36Nqkc737SbWWuJPMz4Oyqj6MfUOSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U28nrQvnssQa0muI336KpmL/4WSRPG4/cqWNx4SW4nJgk1/jmE0oXUQaOgobOqrcNNZWEON3f2ERIVWNYATuBaKfR/V1v+f2TcCvlN9z62MsrPe7uLgs08VZHhKAup5vAHaG+JmMEspcfyeNHRRmRcRpnQmUpwjZSkXLCTrqQYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=szCdj+lM; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="szCdj+lM"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso13309777b3.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575538; cv=none;
        d=google.com; s=arc-20260327;
        b=ll+VbBy55lVSvWEzLrlKFKToMMK/VrKUF0/Wxhc0q2bpRtj5Joj/sjGwwVhTSuyjQr
         BoTZwSbfp+hr4rKeG/USdE1kpUDs7lpHrqZ1lwfJP6qY5qWB50MJkx7L6kaw9ORBN/OF
         rgHi4Pk0WkZCxFTx/4lP5N/FLnTktirlmxkuv67ckVM/Ltd9R9RLNnjOXiKHt36sTtjr
         K/EUoWiUAFYrZpYs1p9xvtumqZbGO1DdDBuPayaWZ3G1EV/15IYCpnoAivqOn0G530HP
         V6TCukOxPJdXA1u5zhNVZGzxsLOHMA1YNliyZ07KFf9AfWdj871bkKRkTRByTchSc7Nb
         HMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w5MPTKLB/ozka36Nqkc737SbWWuJPMz4Oyqj6MfUOSQ=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=KaSViVepdAQKL8JsBJJPswuhjeza8VfRVc+chS/9DlKnKgNvzZT0i4DvlyEXCftxEc
         RTjNec1f2kanAjfxkncWD/i4Dgk6Ko5rUdYVpo3AV00VpgTNd8TqPf5k6Rcx4F99kp/u
         05y8uwN809A+oVTWt0CgBCQrgUXlyY8KC2obcTr1SdDVzrxUB6yLoorbM9CH4dSoBm7z
         DkxuR+x7vfKBr1u3JmLp1T7cS+Dk/RLDqh/y6iPFegpXSvjgVD5+nLHMgKhXA6+rK3WA
         wUDzpR0n0icVKs/QGJsgteTTUdl+gkarTfEt+eormtLkEdEHfL1EnDuj/v2XBgx22X73
         qPAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789575538; x=1790180338; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w5MPTKLB/ozka36Nqkc737SbWWuJPMz4Oyqj6MfUOSQ=;
        b=szCdj+lMxEH+FV0UhCzKZwXGqy8EWyvZfjBY5V71hHijMXFqMjcDJX/8Xnbwa2Lk5E
         bYmj/TRjhrdbqU8TzdogbMJUrp9El+QTeIQBf2TG3/axpfsH5+bf1P/ZCzkoNgkEyexG
         0iaHitDysnixPGjiBVm7xPm2AmWcwi0CMO2eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575538; x=1790180338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5MPTKLB/ozka36Nqkc737SbWWuJPMz4Oyqj6MfUOSQ=;
        b=dGM8yXnUXh+DkuwjzhjHQH61mRdvuEv9w6CKx72q+12U46BGaQDahZvksxqSYC1qYQ
         /hUExeTzGPobOkqfwuzQhDMlduoE19bQU9/ek6KzY+TkL0SOPvSWN33C8FdYzklgnx+0
         PlOg2dPacBF9mX9DEDQ8IlzLQ+ZgPDUzEFu8oaWVkwLayXUudCPLI11XnYuyYZfS+YGQ
         NX8JjN4rUPhwNnE3vCWmpfXaFQW2yuE/HU+K9iwyZY/cOKuj4YSrhNUY9DA+dK6BPW8k
         5JdmFTrxhnohGmW3BJdiv31LSnpfcgF7VXo1+SYOiqPjWzuf+qxNyLeWLZeQAFKBzDr8
         mrFQ==
X-Gm-Message-State: AFuF++kuOV2U9whmGg82CwaLNVpTfnBN4AgZ2OFiekiGUmyszm68IezF
	8CUJm7uJv34SfUizpNzE61BcRgh9I41nvW+I+qoqvLWT4/Bohpfh+GqKJAbUFVnaQXwql359zEH
	zW9prQVmUXsmDKAXS1LzjA6hR7FFCp+pl72VjODK6KGpKK9sWYLXtAcXxlw==
X-Gm-Gg: AYBFou2a8dgx++E5B5k6gTcurxYpgvIS20pLSlpktiaQchnsRmp/W7wDFNGeuMKIOj0
	H0ABLTzGdOqXAXFSjj19hi8PMEuGevFB0tBChFB9lJSSX3pDMHSJNcH5rr6kIaRQnmi82EAuVYw
	S8xxmcqcI5Rxo4G2mmfkeGZGyB3bXpXWviMpgqzAN8vz433emmhBvha5YJNiizaXliZ4JSIlN+Q
	NNsjR5jvemjV3Cq5AT+1GJV06jln/hHZC/bjPntytugdFwucE4KxEz9U72PpScR8LBynxNRLac8
	U727XIG7XqZ0/6jPUcE9nfyXWy3wz8vciLUB76VCTUW4t4mluoevS70iyDRSNgSFuEkkgx2EK4g
	QkoGOzJMB4/4=
X-Received: by 2002:a05:690c:c4fa:b0:894:4ded:2746 with SMTP id
 00721157ae682-8944ded2c07mr490757b3.36.1789575537294; Wed, 16 Sep 2026
 09:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-3-1d3360e21f07@uber.com> <20260915185430.B345F1F00893@smtp.kernel.org>
In-Reply-To: <20260915185430.B345F1F00893@smtp.kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Wed, 16 Sep 2026 09:18:40 -0700
X-Gm-Features: AcwNN1Uy3Zqq6R4enMp4Fli0DczTZO3ER4_1FQ5ycuvVfC9y3_e0ol3-NJdyleU
Message-ID: <CA+w=M=RVrr4Ek5EkfSbuFGNAOMsQQ9ZJ_AKeyyXJ78rupAa9HA@mail.gmail.com>
Subject: Re: [PATCH 3/4] perf script: Add --lazy-load-symbols for lazy symbol loading
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf: memory exhaustion in ondemand_read_name() via truncated =
ELF
> --
Thanks, this is valid. The constant file offset is intentional because
each iteration rereads a larger prefix, but a positive short read must
be treated as EOF. I=E2=80=99ll detect n < want after checking the returned
bytes for a terminator, abort the lookup as a truncated string table,
and add this fix to v2.

Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E41394470
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 04:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432182; cv=none; b=WHlTb+twdwCQGdpSsl5jgb+s3GNy7QRuFnlmNl5/68D/b3qq2A/CCIPy7fvdbfpP6BFTQ/CZt36WBBuJFV484bff+rm3AxnXf53NTcJIhviL/XvHd6uuDXIER3tXIfCLJsLzUpkyMJvFygEamI0bgXX+q/BD76eXkgJA/360PRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432182; c=relaxed/simple;
	bh=vTYCcf0wAf+8haG2OrJz2MEtgGTUmq4EVtDo+7uotEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugBGN6BDv68nfxKgPtsy95JfJdkHUM3h7KHN0VT9Bki5RZrcsZOqhE/QVNT2kdcBjrPCooAzhj0o02Nx1GKpCbd1GVq7ycG7uYR6m2r/KzOorkz0GWqdvoQ8iKRLjLZz+HyR8pdFdVXavFmkuyUkgw08YavMS4FPNIrbfGoc73w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmx6AgTS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmx6AgTS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a6cf104827so1590965a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 21:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432180; x=1792036980; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvRoOScbaY6pOmwJ9M2q65FEL0FaRp9KXeXeqjl1z2k=;
        b=Mmx6AgTSfY9OJxN1wnDNcO77ItMCqWFpbrC04Qn1v9HpJ2DJGya6AJDP+y+re5St8a
         lchbDlPPcMbTHxxwlf1bN9fBS6g13ygr/3CHemwzeMZ+tlJ1/YmgQxse4x7Ad4bizKH2
         WRnxG6kV+yut0QiLiaOkzxgzVftVq/ESPI+EaHcpRYUne3s1C7pxVIkJREI8Q0s4nUFu
         e73r+PjFJnB4Jw4H7fncX1ifoTyfTOAb3qRe4zFLTIl6Hlj6iQE9KTDHUH79gQszx4X0
         Gkx9adwTD0kvqno3yGbb5ly8MV7mv/axJUvu9E4DGUvKcszZ4x5ItqRHQ9mCKsvcjOCV
         kVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432180; x=1792036980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LvRoOScbaY6pOmwJ9M2q65FEL0FaRp9KXeXeqjl1z2k=;
        b=hGDr+rtvhZm25Ilvs1fVg+i+APA/Frq268mdx/crnht1C0DJ7VzL1wZ1vTF7VYXjoQ
         R8naZVfXmzsNm7qC+npE9Y/4kllfPDfzSGJwYbnCU6v55s2iehNCc4WVogoRZE41Mc9W
         DpuRRLacUY8DHkxtWrgLb7OzQhbPSkyuuNyOR9quauP7zICcPZGJFY4ptig5DLlyuCfV
         SxfG6s3VQVLryKpOnfoMj40bE+CaAzLCmsRp0nhn8skoCssXkuAmO235sFqlbWdG2AWC
         aHLELaySLGM6VQ+8BQY9Z6nbmIi3VVEJux7lcin7+g8WOoJfqc9E9xB/AGRTUT1Mejeh
         uBKQ==
X-Gm-Message-State: AFq9FYKXTjcnd8q1m1RTwVoBHm3YqV37xVufTAx8FXBFdY5pHWa6TAw7
	bknNjfiSTh1CkYOhOS1KWFufU1q9XMGnXHFZuONHSli8BuJ4s5GQnSPW
X-Gm-Gg: AYBFou3HtmunXEgIGGBgVNs63+K53D19sPQcPcEheKLviAatAbkgAH5teulnmj56DVz
	zDpXl7AXmqnCxlY4PQpxeSEAEvtDDhohCWhcMrjZfzfdrIFAn80YHkQgTmcvSRdc6oWtPDqPyNL
	1+0Iid4By5jIAOT0jVkvYYX0o+LtvdoY4Qd2sdVa4stJxr1CORIWIjkmCtbiZnNvkpQX7gjrcOS
	xZCZ/Qxisyz9RAKEhy0lYeq1pBCBV4IwF4gmlx1l+4HVuQOMNwNsytu/a4UwehtFeGeifSniDda
	k0gRU6WbaaMzlqXnIzynBnxX7WRKFWOHf5wIcuxPXsJFbX8ciOSnI85kCi+8d4rZ1xH0L+B1sDo
	Jy6LuNQP4PG3l+ZEyEqcitZZf9MFmfWvv3FrOtrxW23sg0QkKA0b+Q0C+n1WadVD8EFyz0skEet
	Ic5J6NBR9eCTedKL/O1qqT1TVSvb+RnkQXvvzq7jh/DfG6/H2os+yaB7okfEBSiYgBcbx2TWq7p
	w==
X-Received: by 2002:a17:90b:134d:b0:3a4:ee64:b880 with SMTP id 98e67ed59e1d1-3a8a0dfb941mr3122084a91.32.1791432179787;
        Wed, 07 Oct 2026 21:02:59 -0700 (PDT)
Received: from mail.google.com ([5.34.221.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9d94ef876sm2306775a91.0.2026.10.07.21.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:02:59 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:02:52 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Changbin Du <changbin.du@gmail.com>, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] perf bench: Add atomic operations benchmark
Message-ID: <ascVxPSLiALhI8iz@mail.google.com>
References: <20261007053027.1738402-1-changbin.du@gmail.com>
 <sashiko-outbox-162645@kernel.org>
 <asa7RZ3NNwpogn8M@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asa7RZ3NNwpogn8M@google.com>

On Wed, Oct 07, 2026 at 02:36:05PM -0700, Namhyung Kim wrote:
> On Wed, Oct 07, 2026 at 05:39:22AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] perf: 64-bit atomic builtins on u64 cause link errors on 32-bit
> > - [Low] perf: Missing explicit inclusion of <stdint.h> for UINT64_MAX
> > --
> > 
> > commit 1f5903d48b4529edce94275c5756879218402332
> > Author: Changbin Du <changbin.du@intel.com>
> > 
> > perf bench: Add atomic operations benchmark
> > 
> > Add a new atomic collection to perf bench for benchmarking atomic
> > read-modify-write operations with multi-threaded contention testing.
> > 
> > > diff --git a/tools/perf/bench/atomic.c b/tools/perf/bench/atomic.c
> > > new file mode 100644
> > > index 0000000000000..08497910b563f
> > > --- /dev/null
> > > +++ b/tools/perf/bench/atomic.c
> > [ ... ]
> > > +static void *worker(void *arg)
> > > +{
> > > +	struct worker_stats *ws = (struct worker_stats *)arg;
> > > +	struct timespec tstart, tend;
> > > +	u64 i;
> > > +
> > > +	pthread_barrier_wait(&start_barrier);
> > > +
> > > +	clock_gettime(CLOCK_MONOTONIC, &tstart);
> > > +	switch (bench_op) {
> > > +	case OP_CAS:
> > > +		for (i = 0; i < iterations; i++) {
> > > +			u64 old_val, new_val;
> > > +
> > > +			old_val = __atomic_load_n(&shared_counter, __ATOMIC_RELAXED);
> > 
> > [Severity: High]
> > Does the use of 64-bit atomic builtins on a u64 variable in worker() in
> > tools/perf/bench/atomic.c break compilation on 32-bit architectures?
> > 
> > Without 32-bit fallback definitions or omitting 64-bit atomics entirely,
> > calls like __atomic_load_n, __atomic_compare_exchange_n, and
> > __atomic_fetch_add on the shared_counter might generate unresolved
> > __atomic_*_8 library calls on 32-bit systems.
> 
> Probably it's ok to go with unsigned long.
> 
Yes, just fixed it by using the native word size for the shared counter — 
unsigned long instead of u64.

> Thanks,
> Namhyung
> 
> > 
> > > +			do {
> > > +				new_val = old_val + 1;
> > > +			} while (!__atomic_compare_exchange_n(&shared_counter,
> > > +							      &old_val, new_val,
> > > +							      false,
> > > +							      __ATOMIC_RELAXED,
> > > +							      __ATOMIC_RELAXED));
> > > +		}
> > > +		break;
> > > +	case OP_INC:
> > > +		for (i = 0; i < iterations; i++)
> > > +			__atomic_fetch_add(&shared_counter, 1, __ATOMIC_RELAXED);
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > [ ... ]
> > > +static void print_default_format(struct worker_stats *wstats,
> > > +				 struct stats *time_stats)
> > > +{
> > [ ... ]
> > > +	/*
> > > +	 * Per-thread statistics from the last measured repeat show
> > > +	 * fairness / imbalance in CPU scheduling.
> > > +	 */
> > > +	if (threads > 1) {
> > > +		u64 min_ns = UINT64_MAX, max_ns = 0, total_ns = 0;
> > 
> > [Severity: Low]
> > Does the usage of UINT64_MAX in print_default_format() in
> > tools/perf/bench/atomic.c require the explicit inclusion of <stdint.h>?
> > 
> > This might violate strict musl compatibility header guidelines, which require
> > explicitly including <stdint.h> for this constant.
> > 
> > > +		double min_thru, max_thru, avg_thru;
> > > +
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20261007053027.1738402-1-changbin.du@gmail.com?part=1

-- 
Cheers,
Changbin Du

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826594;
	b=P4Lw7bGrLyI/ld52VfsXwEG9mFvLrlHFK7Q8eG3Yy6eqglWnvX932YJHZ98yjwB8/jwP
	 65hBT5V0JlAV108+h2l04JwtXh+H+fcYMu0ITYqqLxx5PH61zdAZ5jvHc0oRx1ok0N77h
	 oq6SQ4iYvBVd8N5dNaoSplY+OviOiosmWoDcgmBCz+SZ53W5dyIRGMZ7e0pWT3Qduwwrz
	 0gucl86f100VZACWOODr/eMEMqZWgEupJowU4dPqtjCFUdc0PsBqiDuQhF5p32ocK3V87
	 uWU2JUzJB5J8D9AaUt4BGJC1h5TFo0oxQjjuUUyr1ibb7ZU7PBF67xcrSuV7FWdSTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y6brttOSyQfuPbUsj1XLHAAdWANxJRJocz3zzeqBxf4=;
	b=Lp2AMbZ+7PTvD/DwuiWf4BpfhobGBoqMwc/4X8w8Thcszs+vsPDyRpgd6fWTLRnBGxhb
	 Qd6usxJqnwA2NLKFj3SRK6HhzcnKt8wMAgaBa8JbslcqbkzVS/S2h/xKrU4sMyvU5anS0
	 xfXgoOrXl/OeVjvBksS/I703UPaF5mg8frCFiCuAjAz6c8PJlLzU+3ua8rJ2yOlARAAuX
	 0b/8olP7pHjS1h8ZIQ/bUqri17GkOpSNrEYlC8ZcVdIA/oLrWwypl90HSOLXnVAuO70jJ
	 zjLHNeD/uiyX1NiPD+ekJB8NL/qZwpDVUE/4sTxAZ9Cro1WHDz0T7PyBwhcPEDHcCow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcP8wOCj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F90607D641
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 21:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F90607D641
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcP8wOCj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11043935e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826592; x=1794431392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6brttOSyQfuPbUsj1XLHAAdWANxJRJocz3zzeqBxf4=;
        b=BcP8wOCj2arxzQFs+alSlZyCz+JILiA73KFgmkzjAQGoyDIvjPrP+K7xBrLiFi2eK3
         mRlGQ22LwclkLQVWNEE7rFRCn4lmeosLb44mLuOCLnM7bpb39z3DG9uyxk2NYyq4/DLB
         zqEt+w2RHzTrBhFU9uawtPRbYPS7Flnh4wwaI3Qz+ELj26Eff60qTcWsf6lj6IXXhU6o
         eYgEkzbLGVrgsnX6uH067wxDrT3papVNu5pglxct5YDP4L4ty/f6+39tvvPJqvHwACvG
         i7daE8MCtAHyYROa4SGYOBp889YOPWkw7Y/sd3dXRUqvnhB6li3pfMpBXgozYJJcrLWE
         sI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826592; x=1794431392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6brttOSyQfuPbUsj1XLHAAdWANxJRJocz3zzeqBxf4=;
        b=rO6Bg5FghLexafdNH4QD0lJqdTXkP3ee1h0EyqTMHiHpKmvJUoLxGKVVM7DCOy0bX8
         ftqrk0Tnyf3tVzQqQFSITSN9mIYAxw4JVf0aTjyKfea/iBWSP0PmNLEJ5EKwGaEfHmMt
         LlDEa7UQ9MP+IQKCJJFLSp7yHkH0ePVrj2nCWCFK2edJ7+bBMPrOspTWFEXd1CsVJ73F
         rCH8gDdX1dgT7P5cXLp3PvD/FvyPVAW4g+hexGfo2AN0PPfwozsZDDBFBbgiBNke8PgH
         Fe/XIVyojjUQoLkJEuOX8YUz5ALoQ+IkWZNXjOt6Ja1IvFIY755accwBS5Kr53R1zS1I
         j6qg==
X-Gm-Message-State: APuU4Z8AfqxMFUBuc8EBttdHPiLiMXChcC6+144Qbp8x9FHyzpR1+kAQ
	8O0PX3zV/+p2ls9CMOVi/7XaijRROr1yuASe2C6/fJoAn7ALE/ZKVDkE5zUqObyP
X-Gm-Gg: AYBFou2b/qL/1ArHQLZOIIUWycVw5xs99dSqavARPA700d7tadg22+tir0F9XONR/W+
	aqVUPxfKFOp1yBD74BLhM0SztQEQFSO3LMRqVpB/gF0OWEfGiWX8B9q0js4N3sRbFeCvIsKLhgo
	iSyZ5qhjJFJ1kIPugbWP8te+v3Yl/rm1dVQ8dW9v8Ez8jq01OY5eiQ90WONIv5rVTpvtRFmvGF/
	xeAF9xk+RZxQCK4VWQOfrhXgoPZ/LcW/fQZ6drdghf5UpELG6Mu/iqrvlRbAgQ2czxHo+37RGnG
	rlPMqIz47u+BcUvaq8CkX30EUnOwZnG6Eqs8toc2XmrRPRWv/G7EQYVmKlV2p1XOAq0vgE4sJfo
	f4du7LlDe2lgUC6e+fcsXtp99L5qB3OLFOcBS7fgHU0XBkrOyyP+lkGu21KVG4Rq3AYOJUBORNi
	DSPg5gKzq61NNIqcn1CfRleHKw/Z2qLP/bhY930wKKvydtV/PGHjDBQW2lKvqKHI7Gc5+9vBuRs
	VgbIMQlrMW+FfAup9FmQhToHP/UFon+aSsYd3mq7r5auLDbMKnBODRvJy7qdXQ/6UYy2018XM77
	QBs+aFkVaYt8JCs=
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr372871705e9.18.1793826591951;
        Wed, 04 Nov 2026 13:09:51 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ea592fbsm9904705e9.4.2026.11.04.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:51 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Nov 2026 22:09:49 +0100
To: sashiko-reviews@lists.linux.dev
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	linux-mm@kvack.org, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Federico Di Pierro <nierro92@gmail.com>
Subject: Re: [PATCHv2 bpf-next 5/8] selftests/bpf: Test user memory mmap
 kfuncs
Message-ID: <auufHZQ_hFUvH3w0@krava>
References: <20261103075916.100050-1-jolsa@kernel.org>
 <20261103075916.100050-6-jolsa@kernel.org>
 <sashiko-outbox-194794@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-194794@kernel.org>

On Tue, Nov 03, 2026 at 08:05:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] selftests/bpf: call to undefined get_procmap_info() in user_mem.c
> - [Medium] selftests/bpf: unresolved kfunc externs in progs/user_mem.c
> --
> 
> commit c7cc5f98b3a4b4d8d168ef0934e6c41fe197849d
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Test user memory mmap kfuncs
> 
> This commit adds BPF selftests for bpf_user_anon_mmap and bpf_user_munmap
> invoked from a sleepable uprobe, verifying mapping permissions and
> unmapping behavior.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/user_mem.c b/tools/testing/selftests/bpf/prog_tests/user_mem.c
> > new file mode 100644
> > index 0000000000000..f301a18437062
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/user_mem.c
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <test_progs.h>
> > +#include <sys/mman.h>
> > +#include <sys/personality.h>
> > +#include <unistd.h>
> > +
> > +#include "user_mem.skel.h"
> > +#include "trace_helpers.h"
> > +
> > +enum {
> > +	USER_MEM_MMAP = 1,
> > +	USER_MEM_UNMAP,
> > +};
> > +
> > +static noinline void user_mem_trigger(void)
> > +{
> > +	asm volatile ("" ::: "memory");
> > +}
> > +
> > +static bool check_user_mem_vma(void *addr, unsigned long size, const char *perms)
> > +{
> > +	size_t start, end;
> > +	char vma_perms[5];
> > +	int err;
> > +
> > +	err = get_procmap_info(addr, &start, &end, vma_perms);
> > +	if (!ASSERT_OK(err, "user_mem_vma"))
> > +		return false;
> > +
> > +	/* VMA can be merged, so ensure it covers at least the requested range. */
> > +	if (!ASSERT_GE(end - (size_t)addr, size, "vma_size"))
> > +		return false;
> > +
> > +	return !perms || ASSERT_STREQ(vma_perms, perms, "vma_perms");
> > +}
> > +
> > +static bool check_user_mem_unmapped(void *addr)
> > +{
> > +	size_t start, end;
> > +	int err;
> > +
> > +	err = get_procmap_info(addr, &start, &end, NULL);
> 
> [Severity: Medium]
> Where is get_procmap_info() defined? Both check_user_mem_vma() and
> check_user_mem_unmapped() call get_procmap_info(), and this file includes
> trace_helpers.h, but neither tools/testing/selftests/bpf/trace_helpers.h nor
> tools/testing/selftests/bpf/trace_helpers.c declares or defines
> get_procmap_info().

in previous patch:
  selftests/bpf: Add get_procmap_info helper

> 
> Because test_progs objects are compiled with -Wall -Werror, won't calling an
> undeclared and undefined get_procmap_info() cause compiling and linking
> tools/testing/selftests/bpf to fail?
> 
> > diff --git a/tools/testing/selftests/bpf/progs/user_mem.c b/tools/testing/selftests/bpf/progs/user_mem.c
> > new file mode 100644
> > index 0000000000000..e3b0689f5f2a5
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/user_mem.c
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <vmlinux.h>
> > +#include <bpf/bpf_helpers.h>
> > +#include <bpf/bpf_tracing.h>
> > +
> > +#include "bpf_misc.h"
> > +
> > +char _license[] SEC("license") = "GPL";
> > +
> > +extern unsigned long bpf_user_anon_mmap(unsigned long len, unsigned long prot) __ksym;
> > +extern int bpf_user_munmap(unsigned long addr, unsigned long len) __ksym;
> 
> [ ... ]
> 
> > +SEC("uprobe.s//proc/self/exe:user_mem_trigger")
> > +int user_mem_test(struct pt_regs *ctx)
> > +{
> > +	if ((bpf_get_current_pid_tgid() >> 32) != monitored_pid)
> > +		return 0;
> > +
> > +	switch (action) {
> > +	case USER_MEM_MMAP:
> > +		user_addr = bpf_user_anon_mmap(map_len, map_prot);
> > +		break;
> > +	case USER_MEM_UNMAP:
> > +		ret = bpf_user_munmap(user_addr, map_len);
> > +		break;
> > +	}
> 
> [Severity: Medium]
> Can user_mem__open_and_load() in test_user_mem() succeed when loading this
> program?
> 
> user_mem_test() calls bpf_user_anon_mmap() and bpf_user_munmap(), which are
> declared as required __ksym externs, but neither symbol is defined or
> registered as a BPF kfunc in the kernel or bpf_testmod. Won't libbpf fail to
> resolve these kfunc BTF IDs during user_mem__open_and_load(), causing
> test_user_mem() to fail unconditionally?

defined in:
  bpf: Add user memory kfuncs

jirka

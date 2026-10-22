Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635743;
	b=dVDs1qco9DM8e3Wub0lbhEnFelALPrh0trG2PvRfairy5TawkeOFFOQiu3t3aOEb0oSq
	 mWj+HLQKOcouoIg8pQaY7+LDeQE5MUxgqUDVxzqIYhp9ZhW4atv3j/kOgDyLbABCDXjTv
	 MnRn4W/5DiHGtyeciKYHjv9htGiuOe2TJ2hyKcOepEwQkWF8IWVdy1Fk18pz94efdC9QD
	 ROneobfKpk0qNWVDWft0wnQz6xIOo9HmEQprsByqY12knKnbQqULw9mBSFHRve4pkDoEs
	 mSxetnlCcAGgtIlmjH73DJVmI+LK8BJrTd3OexGKiAZr8ncPQ/gTkIZVXLngwY+P7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:Cc:In-Reply-To:References:X-Mailer:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XxjX1g1mQUEUPhKLrpLxYSgZ8S+x7GSgwLX7BwyjX7g=;
	b=pNoU+0yUpgqgOndCQ4UyeXXkoP3IiyfGB1Az0nHo81NnShWgWntZcuYRBbMbZCvDo1Uk
	 wgpcGqYmKzTrBeZPSCG0qPywW7m6LKB4672jzd4e91caehnfF1Jj6fur9CdJ9EBSRGuFU
	 AX7twY/zIoD2pc0tbnvCA9v3ZmcbiVdTLH3U+mJQ3fI/Fgay9Cwqxn7RHVCDeaHuT0sPf
	 ML5OmYFIMEJqapLAniGkOUVBIUjw0iZgP8h1mTlkCwzJCnvIIsFixunO4ZOzuE7ZPAUf9
	 0Ih5f8qP20X1zj28a9MkUvi7w9zzz0D6Q6l8s/n4JJ38cDBCmCDnj7/77zFfzd/kBEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lTP2uRaS;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20503606A31D
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 02:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20503606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lTP2uRaS
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06210b29fso535744b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 19:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635742; x=1793240542; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxjX1g1mQUEUPhKLrpLxYSgZ8S+x7GSgwLX7BwyjX7g=;
        b=lTP2uRaSGKGfObXmIenachu/rRr0TAOstn88LtGDf10b3Iju9hd2gR6PQ/ACpstiNS
         EYB3SmxRHpyNHg8NIi6mawtaMWEag79DkkVpbr0WGLqDIvjhsf/vTFYvPzNCHQfemsY1
         t6f+NPa2/hqZBd/T1iauXzJ38UWNjWCYfPHXsc0tpTfjdWc77saDoAwAkGjV4gMR1sOb
         9jXJ9NiMuFrNIQ/PawhPF5wRfjNK0yAjfn6WdTqZnTTmHZ98ZqSvbVIn1PirgF4TJ34S
         SwPzTTSPh9qw99D88sOApdBR1BI4hLiUvHQsP7fFSCuqpxidmhSUPVupaNcldICK5GQh
         g+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635742; x=1793240542;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxjX1g1mQUEUPhKLrpLxYSgZ8S+x7GSgwLX7BwyjX7g=;
        b=KaJsg/YV/dMtzbdzNNl2AdGmTCGwsHGLaON0q0KW1PvUGXkSrnwKYGxWn5Y2hEDXJp
         KqpR0S83yt+KJZ1RiHOSkRb7b/iwImV1QQiDwrpAhbggf8FK8SOvTkaERTuMzrWrAXai
         ErzIzB1DYJTuDfZjVABglCb9GE1AIZ7KGEuMLbSr35hHJQCt0U0TCzjq5AHHOUXMu7Kt
         JZNrahjnClW7djCJokI7H8F77fo/cjIu/xTAhFNZFlwdSk94ko9uhO61eBKE5Ioabdbw
         zYQnmMYsJikHKhCXyc0nWffFqOl8fDPBwu8hef8K8lnvCAT1VBrxJzMkbFwjNDGMfW1n
         vk8Q==
X-Gm-Message-State: AFq9FYLxNGSjUVxPASUKtWNYPuT4Iu+BwtRBcpxK5i3VXCUoIcZQQrHQ
	XpyM6i7yTcaXAcAJHZGLOCOTKmUKftXuFCFFkYuqgdw1mHU/sn42GoudLzvCsQ==
X-Gm-Gg: AYBFou24TwUkXsst45NowYONcIIIvZEZfM+d6ubFaWcr+SAJoEYF+aeQe9hwp3651S6
	3GZwgrOpssNT3DEmqlQeuerBqyoEKqC64GwAfZXZA3biXSN0Fhdqd9K8Ss6WZUIHSilhtqAf1lN
	XRB120Hf9eYVTNBdJHkhWb5kHKxNav6LHu+lbm4LleplP3lt2VJRDAWLa2AnxB18ZvOdTiiorCE
	3icxIh4S4Jwumg+K+kU7qoHO9oxW/9JxDunx4p3zRkbGpYEs/MJClQCMDcHFffl/9ZHknGVLmWs
	p8lMraTUy6Y4TcDCzr6rdvPDOEG/oCL/fl76CdizuHzhbxdgaUISfDgiv6JH0sQgQnfwzEntStb
	MsUWwjbYOdRnVd6KnYWKEQlhc8wWbaZ9dQYrN19NovCk1HU41nKOv8FP4xQOv2PVmuK3coEvasy
	lEDGX0PqM3IqArrO+3UEoam+jCiJZuEbZmfb8hqKKldR68d4rKcGHbFgXvjQdWgNyU5c2Mq8ezB
	q0tZCiB6Ui6bqf1E5Op2lFDbPghcJJaMDLmLI6JsC9lsE91SfIgYp4qpKwJueYOYnN1nQ465QTy
	u/KPjahETrhWTd5/B9QLASd/qmDJkWsNqqf6AbccvJ86G6ojf7G9CC0U2/yq
X-Received: by 2002:a05:6a00:b49:b0:89f:37a0:b2cb with SMTP id d2e1a72fcca58-8a089eba62amr2905819b3a.49.1792635742236;
        Wed, 21 Oct 2026 19:22:22 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b4206sm1450303b3a.18.2026.10.21.19.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:22:21 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 02:22:20 +0000
Message-Id: <DMB0C24NTIST.YQZ2Y3E0I1I1@gmail.com>
Subject: Re: [PATCH bpf-next 9/9] selftests/bpf: Test uprobes and fork()
 with busy mmap_lock
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <oleg@redhat.com>, <peterz@infradead.org>,
 <mhiramat@kernel.org>, <jolsa@kernel.org>, <akpm@linux-foundation.org>,
 <liam@infradead.org>, <ljs@kernel.org>, <surenb@google.com>,
 <david@kernel.org>, <vbabka@kernel.org>, <jannh@google.com>,
 <hughd@google.com>, <kees@kernel.org>, <mingo@redhat.com>,
 <tglx@kernel.org>, <x86@kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-perf-users@vger.kernel.org>
In-Reply-To: <sashiko-outbox-180860@kernel.org>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com> <20261022015712.1297331-10-alexei.starovoitov@gmail.com> <sashiko-outbox-180860@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 07:10 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +#define AREA_MAX	(64UL << 30)
>
> [ ... ]
>
>> +	area = mmap(NULL, AREA_MAX, PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
>> +	if (area == MAP_FAILED)
>> +		goto err;
>
> [Severity: Medium]
> In tools/testing/selftests/bpf/prog_tests/uprobe_busy_mm.c, does AREA_MAX
> overflow on 32-bit architectures when passed to mmap() in hold_mmap_lock()?
>
> Should AREA_MAX be sized appropriately for 32-bit architectures as well?

No. uprobe_multi link is 64-bit only.
bpf_uprobe_multi_link_attach() returns -EOPNOTSUPP on 32-bit and
three of four subtests attach with it.

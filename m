Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471791;
	b=qgUPgyaV2IsraQvp7hauJf5gYMGFgkNk2+2GuPZkEaQdQdIn9oQYt3WNPe5QpJ4xVlZS
	 GmLRXyOGR2kJZ5P2VcFVvrsOt0RD2uqZSPfUbiM3C2rfEW5j9gTJqUm96NGUF0/jLkEF0
	 QFcZ2kp6FkvC4gAGU3QlItiiSmyZogXRJ6mww8w14IjQyb578+qzGsYO24bFKugSNuvPO
	 rkpdC28WyzkcwyLtIux5bmbsc91EH7eub884y/gbqv8Q+Wj3Fh941lgpXYmk1MTTgDFmY
	 g3bOZAuX4wfwCMaH1hZdd03wK3Q9sax48Geu52aUWTVmwED68giB/+AeOy15hMdo7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vz58Cre/aXSIBNc6xkRmR7HEG/rtQyKHMhQgyqCK6QY=;
	b=EicHG2NwndZxlslFsXq1Ds0qaxQVwCF7t7Ite7d48E9VZNMvPlJkqIAcnpH4U5r8ynsI
	 4ge95uQ0XHw8/NpQaDKr4gcGn0Fyfp4byrGsVSFhJPsnN7nbaM0ruiT9n5eDDulU66uDi
	 mF9qCXpuTmlWyCixh+2BhSNelqriWKRDm2VhPXFld0iVwfq2KezqoEM20TC48VOzTU4cL
	 rWFI1KeI0gVKbmAT1C2+2TWI6p24LKsXvZy0bb4gR8hXyXDOtpoUvtC6mw2vi00cpIN55
	 BbfBxeIhpkGW9bqOqP11RwHjw8UCCrw4bmiDaRCqar16N6qmQYFz5HpfG2YgK+9dh2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cK/T9a28";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624F606A684
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 22:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B624F606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cK/T9a28
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so40604505e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 14:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471789; x=1796076589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz58Cre/aXSIBNc6xkRmR7HEG/rtQyKHMhQgyqCK6QY=;
        b=cK/T9a28m24VXoITul9AQYWTupW8G5xqcW7tprYwSev+Ei2a1ld9CzNZ/2/+F0SYgP
         nvgNRvUmXdXFfyU/IUPIiI0mlPze5SYNHLOiAg4nMtwAS5GU+LSx3AetU8QSgffAITme
         nF9rdmW5XqZD9OV8t6AXAHu/fDnxxe+bWy9f6l8a9/O8f30IkoGc2iVZ762qZTqPK1Bk
         sP/L4I7MJ3fraYakaUk2lg1MDp1YD0NbQ2vIRVy/XdSFKOu2KCdb/cUy+wBINFhGJLe5
         SATjt+JukffjsUj0MPH50dtzL/aLkVuTskFCM7tR3CX0BjrTaagT0FGPAT1V4i7MiaYE
         WysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471789; x=1796076589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz58Cre/aXSIBNc6xkRmR7HEG/rtQyKHMhQgyqCK6QY=;
        b=GJSF/NXp5K2N0KI/J4sGfAQbAkk79NEaSfxil4CwA49phq/7ZR0uuhABNFWV+wEO8o
         ebF00FLz9vwiM4NQBCyNYN82EW3AtFHGPu74A81YlmXsIXdKxVsoj9b0m04C8SyOUoFc
         PR1/36Ork6t95LpXhriPE0gzBUuEURD/ybOO/M2io33Ij4f8CK5jFL3a6bDuDQ+UfRiR
         7tO47ye3W3fV/ZepwQ70PCLld6oPMoPcgA4o+qrr57LZ0cYxOOGELNmHNYcWcpIoYmEq
         UuxuIoM/gUTiyd8+x1xfrzgqUdRA7bw+r39LKBUOuIRqqCxsrP0DbXRSq3guN9rMW+7R
         Fr1g==
X-Gm-Message-State: APuU4Z+vBew43d1wUU0Fs/pnc4vpuF9IH09T7/qL9LguZmXNiZdJxM4O
	yFauFcEl1Rdk/ua3iKOiO3Cp+Ph+Kyk87YUIM7VpwLRzh7nf+JjeXfdY/N2W1Q==
X-Gm-Gg: AZFdTZfbBi5rIMoWO+TXS6m6uTDWld96CyoYJbVfa94h0W2uVWpTZj0cvaNfBt86iTz
	bnBnckgw3bIaRMtKlLWTbOqZnh2QHeKpKG9RqSGSsrrDRHckz7SjI5Sjtxs/jfEqZJr+N9fLIum
	psQlYn6PQV9MNNyCMG43orhXlq1MdIXMqJR4tnfdVPVy42s+AOvAdIVcA23tgaFfnWGAm9zCyKi
	P9YeeUnsa/ry95hMGnK1Ra+Np9L5o7bEQTTe9kLCUp0na8A5AV+8aJMVeCxclfPw4DVeBQSxo7K
	+V7wcjYS4/Q4kAcn7Jz139H26c5PXc9l+M5GM80ebjHVOd6/GaOqfLSJT+hSBI/hM6DrRclnZEK
	bJvxNMMcQmtm31sI1aIkGzbJhod9JGyjyY7KZnGmOcj7tzsV2RTcA8IwJfhZEwZXNG69tAvTQm+
	kK8kKygJnkKeNVkRM9OgDH71OcQXewqIXKx0NFUYR6diNFvbhizx40U60Xu8KVQ0EaCNR3w7UFT
	efNW8aUgB9eTwpSRIbg5/KlZlDYO/qMLyXAIvJQF9e4zi8aaEzNopR5heO7mFmRvFjek7ng32Ho
	H1rHHtebq+7TN+E5
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr292245375e9.9.1795471789043;
        Mon, 23 Nov 2026 14:09:49 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm372260275e9.6.2026.11.23.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:09:48 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 23 Nov 2026 23:09:46 +0100
To: sashiko-reviews@lists.linux.dev
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/9] bpf: Add log support for tracing
 link_create
Message-ID: <awS5qgoIeSAheK-w@krava>
References: <20261123152743.19629-1-leon.hwang@linux.dev>
 <20261123152743.19629-2-leon.hwang@linux.dev>
 <sashiko-outbox-229589@kernel.org>
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
In-Reply-To: <sashiko-outbox-229589@kernel.org>

On Mon, Nov 23, 2026 at 03:38:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] bpf: non-UAPI field name tgt_fd logged in
>   bpf_tracing_prog_attach()
> --
> 
> commit 476f541041ef9d87251f0598129c4def280d1320
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> bpf: Add log support for tracing link_create
> 
> This commit adds verifier log reporting to tracing BPF_LINK_CREATE for
> attach parameter validation, reattachment checks, and target compatibility
> checks in bpf_check_attach_target().
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index ec8e787929112..80504011403f6 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -3677,7 +3677,8 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
> >  				   int tgt_prog_fd,
> >  				   u32 btf_id,
> >  				   u64 bpf_cookie,
> > -				   enum bpf_attach_type attach_type)
> > +				   enum bpf_attach_type attach_type,
> > +				   struct bpf_verifier_log *log)
> >  {
> >  	struct bpf_link_primer link_primer;
> >  	struct bpf_prog *tgt_prog = NULL;
> > @@ -3714,6 +3715,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
> >  	}
> >  
> >  	if (!!tgt_prog_fd != !!btf_id) {
> > +		bpf_log(log, "target_fd and target_btf_id must be both set or both unset.\n");
> >  		err = -EINVAL;
> >  		goto out_put_prog;
> >  	}
> > @@ -3726,12 +3728,14 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
> >  		 * attach_tracing_prog flag is set.
> >  		 */
> >  		if (prog->type != BPF_PROG_TYPE_EXT) {
> > +			bpf_log(log, "target_fd is only allowed for freplace prog.\n");
> >  			err = -EINVAL;
> >  			goto out_put_prog;
> >  		}
> >  
> >  		tgt_prog = bpf_prog_get(tgt_prog_fd);
> >  		if (IS_ERR(tgt_prog)) {
> > +			bpf_log(log, "Invalid tgt_fd.\n");
> 
> [Severity: Low]
> As reported by Alexei Starovoitov on v2 [1], should this log "Invalid
> target_fd.\n" to match the link_create.target_fd UAPI field name used by
> the other log messages in bpf_tracing_prog_attach()?

with this fixed, the tracing_multi changes lgtm

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651247F2E6
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905475; cv=none; b=ojOvnHXoEhOL4cus9GL+1jG4xxhM3B+VsiMrjFCW5y4ljQvU2qNkE9RvqC7ZUFZ4cVOrJSfh/Ary9jz6rHlfCugm7GzdgWh/9te6W6w2e4k8g0c1WwInxAFaVxyi3M2RJtwDL0hmWcIfxDJIOEOhTuWbdag2ZVgjnlgfqFk7g5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905475; c=relaxed/simple;
	bh=DhSFmLeEgdGWi+ae04/gRPAnaho/FIceghLEfYJsDT0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAWLayt6qq/wamPcc/6jWoPaQpQZ+hrZVkPp7mYSlCXIWjgLi0zqurAhhVS7jNHsdjS23IYmq3npxasipER1PQSz6+3SYbHzAG20u97g+ThwF/MK/NFjndFHl8Fm2OfvdyKoFoR0UfWxe5QrQfasTuGRCy9z0C5xAX5UnIKz9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9RkGJQ3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9RkGJQ3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47488efcf30so314566f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782905472; x=1783510272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vShrZYDj30pK3AOFiKf2PUVnjLWAcQPFaE6HtzGHisg=;
        b=F9RkGJQ3b6iih4/2d9ZNb6gkkzn8xWClOUrK/ZCrDNSS94BrFLPUReQ4IJy7Cc4eSX
         m53Ck8NsdOuCZKXTy309fVIBIL/ucqE1d+3WohrAvSkPK42eN/Q9Fthgwhx8Hvs++9kV
         LScz0GgxH4/Q6S1pQ9lr0zT8iXu/oEbNSs1XhW5ae28D2gwLTb/SJHyKL6prvTF0QhUX
         5wWmx1S+PVDo45NBhnFSDWCIqkZQiKl4Zk3SGxqn8YCgS1udxBEu5VLpv8F7iq9D8jNS
         hFkrxspXuK2nHvMON6Om1/f1riL0bxnlcLwvcGw1NYNZUGlSTlG+UKfYkmd86aJFEHJF
         1E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905472; x=1783510272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vShrZYDj30pK3AOFiKf2PUVnjLWAcQPFaE6HtzGHisg=;
        b=EstUQi8uxPmKgCkD9Vl8i++8aQTZntHfN1h7N2udKe+iT0uYhohp2S8gtS2Buft4qe
         KOqxhApWTT2MZlAVC3laxJwU4t1fSmmZctjuqr0WtnDGWiLZ9tf0uuS1o2BeUw+EwNF2
         v68KUwWNFrZQxoZ8QfzxW/fFNJLFBu6CEhe3yMqkMLtfk05+uACRZy8hTbB5bYbMdf4H
         ExdzAR9OO91BJzrNX+OnzseD3nG/JSmGRI2bCHX9c8d+/mwBRvtF/B03MuKOlGdFFBjQ
         zg7PwnqrjKbp5ZAAjxpzNuEZavK7AbN4rjgR2ykvdvayQK8F9z9OtExnxGq/tOsOFn6N
         1/Kg==
X-Gm-Message-State: AOJu0Yx6rNgermwM0+arTlBIXqq10L8+T+ajq0RXClSXP3YMLgnQbHZB
	mGDdV0uflQnThfWW79wCbuLLZM0R0HOY8Air34kD+Gw/Q1NkyB912PEPqSqG0A==
X-Gm-Gg: AfdE7cl7bd++EIc/vXkDNlK9vVtXNr/lHBw+g2OXYkGdRilCCs+kU0+AR+FGfV3vbVZ
	5F2AvMi5oMmUCMXZ+4tDRyf4LuYhW21tCML39/s33UqsP0s25OminZ8oQPUyEcYdy/xaqN7d0AF
	7+IA/enJvgOj3W4sI6isweXOjS2QVKEYZ9jei3D95qgaqqIicS0e+F1/XBBMaoBL/GuFk9kB+hf
	KHc/bsnPHF1frgA65JEZRpgDCRkb9JL/WmUSGzl5A6AiiyX8EMdvJ/exBHzP/R0ojDraiKC9s8i
	49NzJMXHSOsdKOtxvQC5i6anVUVWKcpo+s2/zlO7D9avEB+nc/Z9f1HW4O5ghm3HvYf7hReQEID
	JTALRcz8fJGZ0QJDT4SA5+ZFDnxBIuZrbg1ylcUS2fuhOsqQLc945ThQk4VlOxLBkPz/f4M0o7A
	f+d7V9i9qQqTj8Z0NJfyHLHCy9kwtmx5+9RoE=
X-Received: by 2002:a05:6000:2311:b0:460:3233:beed with SMTP id ffacd0b85a97d-4775a6d1f9fmr1984131f8f.41.1782905472203;
        Wed, 01 Jul 2026 04:31:12 -0700 (PDT)
Received: from krava (37-188-177-177.red.o2.cz. [37.188.177.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm16164248f8f.7.2026.07.01.04.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:31:11 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 1 Jul 2026 13:31:08 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv4 bpf-next 3/3] bpftool: Add tracing_multi link info
 output
Message-ID: <akT6fHCSdJGFXmcK@krava>
References: <20260629212208.895962-1-jolsa@kernel.org>
 <20260629212208.895962-4-jolsa@kernel.org>
 <20260629213330.0ACD41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629213330.0ACD41F000E9@smtp.kernel.org>

On Mon, Jun 29, 2026 at 09:33:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] bpftool uses a non-existent `tracing_multi` union member in `struct bpf_link_info`.
> - [Medium] The kernel-side `bpf_tracing_multi_link_lops` is missing the `.fill_link_info` callback.
> - [Low] Memory allocated for `ids`, `addrs`, and `cookies` is leaked on the error path of the `bpf_link_get_info_by_fd` syscall.
> --
> 
> commit 3c4bad76286f49adf87a7b01dc7042ac6368c5ce
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpftool: Add tracing_multi link info output
> 
> Adding bpftool support to show tracing_multi link details. The new output will
> display attach types, counts, BTF IDs, addresses, cookies, and functions.
> 
> > diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
> > index bdcd717b0348f..088d1d206065f 100644
> > --- a/tools/bpf/bpftool/link.c
> > +++ b/tools/bpf/bpftool/link.c
> 
> [ ... ]
> 
> > @@ -403,6 +422,52 @@ show_uprobe_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
> >  	jsonw_end_array(json_wtr);
> >  }
> >  
> > +static void
> > +show_tracing_multi_json(struct bpf_link_info *info, json_writer_t *wtr)
> > +{
> > +	bool is_ibt_enabled = is_x86_ibt_enabled(), show_symbol;
> > +	__u64 *addrs, *cookies;
> > +	__u32 i, *ids;
> > +
> > +	if (!dd.sym_count)
> > +		kernel_syms_load(&dd);
> > +	show_symbol = !!dd.sym_count;
> > +
> > +	show_link_attach_type_json(info->tracing_multi.attach_type, wtr);
> 
> [Severity: Medium]
> Does `struct bpf_link_info` in `include/uapi/linux/bpf.h` include a
> `tracing_multi` member?
> 
> It looks like the `tracing_multi` struct is missing from `struct bpf_link_info`
> in the UAPI, which causes a compile error here when trying to access
> `info->tracing_multi.attach_type`.
> 
> Additionally, the kernel-side implementation in `kernel/trace/bpf_trace.c`
> appears to be missing the `.fill_link_info` callback in
> `bpf_tracing_multi_link_lops`.
> 
> Without it, will the kernel silently return unpopulated link details when
> queried via `bpf_obj_get_info_by_fd()`?
> 
> [ ... ]
> 
> > @@ -1114,6 +1226,26 @@ static int do_show_link(int fd)
> >  			goto again;
> >  		}
> >  	}
> > +	if (info.type == BPF_LINK_TYPE_TRACING_MULTI && !info.tracing_multi.ids) {
> > +		count = info.tracing_multi.count;
> > +		if (count) {
> > +			ids = calloc(count, sizeof(__u32));
> > +			addrs = calloc(count, sizeof(__u64));
> > +			cookies = calloc(count, sizeof(__u64));
> > +			if (!ids || !addrs || !cookies) {
> > +				p_err("mem alloc failed");
> > +				close(fd);
> > +				free(cookies);
> > +				free(addrs);
> > +				free(ids);
> > +				return -ENOMEM;
> > +			}
> > +			info.tracing_multi.ids = ptr_to_u64(ids);
> > +			info.tracing_multi.addrs = ptr_to_u64(addrs);
> > +			info.tracing_multi.cookies = ptr_to_u64(cookies);
> > +			goto again;
> 
> [Severity: Low]
> Do we leak the memory allocated for `ids`, `addrs`, and `cookies` if the
> subsequent `bpf_link_get_info_by_fd()` syscall fails?
> 
> When jumping to `again:`, if `bpf_link_get_info_by_fd()` returns an error, the
> function returns early without freeing these arrays:
> 
> tools/bpf/bpftool/link.c:do_show_link() {
>     ...
>     again:
> 	err = bpf_link_get_info_by_fd(fd, &info, &len);
> 	if (err) {
> 		p_err("can't get link info: %s",
> 		      strerror(errno));
> 		close(fd);
> 		return err;
> 	}
>     ...
> }
> 
> Should the error path free these arrays before returning?

right, that's pre-existing issue, I think we could do something like
below.. will send a separate fix

jirka


---
diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
index 088d1d206065..3f5b3b12a404 100644
--- a/tools/bpf/bpftool/link.c
+++ b/tools/bpf/bpftool/link.c
@@ -1156,8 +1156,7 @@ static int do_show_link(int fd)
 	if (err) {
 		p_err("can't get link info: %s",
 		      strerror(errno));
-		close(fd);
-		return err;
+		goto out;
 	}
 	if (info.type == BPF_LINK_TYPE_RAW_TRACEPOINT &&
 	    !info.raw_tracepoint.tp_name) {
@@ -1281,13 +1280,14 @@ static int do_show_link(int fd)
 	else
 		show_link_close_plain(fd, &info);
 
+out:
 	free(ref_ctr_offsets);
 	free(cookies);
 	free(offsets);
 	free(addrs);
 	free(ids);
 	close(fd);
-	return 0;
+	return err;
 }
 
 static int do_show(int argc, char **argv)

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DED2D738F
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787351223; cv=none; b=lJNP0DKe35cK0gmyBOaqfL3S8C0PEX+PMBgaNiTy9RbWU+02sa5JbHD6E3ZyV35v/jdv8XSRBfvDmBCRU+bqmflDImsTOfshxX1q+IrXqsGUgnpeLxYvoDlUBEA5MXXPBQzUGl23JHOgcA9qAihv9Nu5OMWfXRhonnv8EQlea0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787351223; c=relaxed/simple;
	bh=/mRqRCrLu/klHlCSIJr34/qAaSEzVL+/2aev47nzb9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nQYPgWv6Z56JfEQ8ceqmYgXetP4X+8bLFRGf3ZtS9PnvsDEzJ7M0f+O3/nzbT5dL75uwgGMfcyVqXVbvqoSk2HUut2uev2g/1KTmnSb1jJb0mMBe3ZAFhXUN2DisiTR+PqLkx77e+rX0IyGvaIMf1F1Ii6bjzEsjCs8tVpWH36g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TndyTmlK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TndyTmlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787351220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxrz9oWbrps0Xg/pepNDSh8wKYmYOVL2XSIyhw5jxfo=;
	b=TndyTmlKHyfeyE+R3W/tzO/gQfakXy7rkhV8PxalYmrNtMD16MtAnWidUH+7ZPnw0xGHVj
	LFU6F+iiOT6YCLeXdDPZjPRyl1hrq+aBzulXmeUt91vjqMfCUImcV5RmFEy780kkZUuZki
	6m78FlC5khOY4rEnFOZapWKaqEcZGdE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-YyQM-ZdkNvycRtGzuYfyRw-1; Fri, 21 Aug 2026 18:26:59 -0400
X-MC-Unique: YyQM-ZdkNvycRtGzuYfyRw-1
X-Mimecast-MFC-AGG-ID: YyQM-ZdkNvycRtGzuYfyRw_1787351218
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so276171385a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 15:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787351218; x=1787956018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxrz9oWbrps0Xg/pepNDSh8wKYmYOVL2XSIyhw5jxfo=;
        b=b2c17qDZy64keF/GuF9vmjf4sQrTOGKY9ZdTi5K1VofNgkYXpxMrgQRD/geJaoMgZA
         QUr93obIZcJNFpSyUvsSixj1tL+3RXPjbTIXnyZnu89U10Ti/0K2qNpU1ZsmX/zhjEWT
         L633+mJ4ev4ixwlIGRKD1mAyDXcKFxsEkyyOB1lcIz4/v01S5hI7vdlKn4xs/KvzbJLL
         KnM+FKguo1oLRAnv0wUizJXO775w6DYkktr0Q+a7BZucaRy8Mkt2IqR7GKVyXOxdVSe8
         SJwZZrLwFrv/RRyhTic0jJ58o0ZtqSU4uzYFki2jOLMsrAtRe+XLb419PVsSf/yvqNTb
         72qg==
X-Gm-Message-State: AFuF++kGHsrcKIiyN2PRHFQbg8XwWa+dawCJV4Dr1N6vPpmTROro2DgS
	18sx+NBTb8HHH/DLy5XkvkiuyCT07Recpqy8x1bJfv3/6P3bVRVI2uasp2Ej54vp6p3hXiVl8H7
	XFQ/W9dgowZwoUstX/MeZBZuUNXIdOe6vYGUbnRjv7N9XOxiloFv7lLGbL7yW9eNW04KwOh4SQW
	LsBZBhvo/w6+EEqVSnJM9pwMA/EJCPKCtXGYJVPS3VQuSdDZWTKW644w==
X-Gm-Gg: AR+sD136LR+5HVEliS3Vlz5VRkacOi1oT92eTvLWy9vNcztbWN6HqUm111z1cHhpX4W
	gKLmkYjo2faybDJ7WFRLWfdshRO/bGYpqMzegvlCGsL8HnaKpkUcw3E2i3WC7F93DRCXPaROMbn
	MngYxDRjU84RG/yyGSLikME3KCPowNBwiGipnSCHGyW9brm727AJZfTMWkpCS42VqYkgauft+xn
	SSm5lVrqXBs90E80KuIXW8eLnzFII6Xymsp4FoNvgDr5Qkb8S36S3VJrBLWxAMablLGt22ZvFZp
	d5RwhbmJgWk64y8zQdTcFNzurasn1JAWzIKHmQOGGBWVllRjoKsipZ+3pw6OMze8321B4EF1hBI
	US5Q+4vxGeWWFVnK4p0KMh0Gq7WkyF9lNfnmtvNgoafVp
X-Received: by 2002:a05:620a:27c6:b0:92e:7075:941 with SMTP id af79cd13be357-937284a3abfmr1742928685a.13.1787351218411;
        Fri, 21 Aug 2026 15:26:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27c6:b0:92e:7075:941 with SMTP id af79cd13be357-937284a3abfmr1742925285a.13.1787351217799;
        Fri, 21 Aug 2026 15:26:57 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d91d2fsm10152785a.25.2026.08.21.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:26:56 -0700 (PDT)
Date: Fri, 21 Aug 2026 18:26:55 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Subject: Re: [PATCH 09/11] selftests: cgroup: add a vmtest script for memcg
Message-ID: <aojKoF4KR3sRhHHP@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-9-d21b165b8440@redhat.com>
 <20260821190956.366A41F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260821190956.366A41F00ACF@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WZkfnN6ip07QOwjffXkgZkknTgIEO6vrLQ_aYTenOQ4_1787351218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 07:09:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Use of bash-specific `[[` command in SSH remote execution.
> - [Medium] The background `vng` process is orphaned and leaked on error paths before QEMU creates its PID file.
> --
> 
> --- Patch [9]: [PATCH 09/11] selftests: cgroup: add a vmtest script for memcg ---
> commit b0194f809e3b4d9bf07134eab98efb01f6db5c8d
> Author: Eric Chanudet <echanude@redhat.com>
> 
> selftests: cgroup: add a vmtest script for memcg
> 
> This patch introduces a vmtest-memcg.sh script to provide a repeatable VM
> workflow using virtme-ng for memcg tests. It boots a VM with CMA enabled in
> its kernel arguments, enables memory_cma_accounting, and runs the cgroup
> tests inside the guest.
> 
> Link: https://lore.kernel.org/all/20260706-kunit_cgroups-v5-3-6c42c8753468@redhat.com/
> 
> > diff --git a/tools/testing/selftests/cgroup/vmtest-memcg.sh b/tools/testing/selftests/cgroup/vmtest-memcg.sh
> > new file mode 100755
> > index 0000000000000..b19b967317849
> > --- /dev/null
> > +++ b/tools/testing/selftests/cgroup/vmtest-memcg.sh
> [ ... ]
> > +cleanup() {
> > +	if [[ -s "$QEMU_PIDFILE" ]]; then
> > +		pkill -SIGTERM -F "$QEMU_PIDFILE" >/dev/null 2>&1 || true
> > +	fi
> > +
> > +	if [[ -e "$QEMU_PIDFILE" ]]; then
> > +		rm -f "$QEMU_PIDFILE"
> > +	fi
> > +}
> 
> [Severity: Medium]
> Is there a chance the background vng process could be leaked here if the 
> script is interrupted or times out before QEMU creates the PID file?
> 
> If the QEMU PID file is not created in time during vm_start(), the script
> calls die() and triggers this cleanup trap. However, because QEMU_PIDFILE
> is empty or missing, cleanup() won't attempt to terminate anything.
> 
> Since bash doesn't automatically send SIGHUP to background jobs on a
> non-interactive exit, the background vng process might be left running
> indefinitely on the host.
> 

Ok, lets fallback on kill -HUP -$$ then.

> [ ... ]
> > +vm_start() {
> > +	local logfile=/dev/null
> > +	local verbose_opt=""
> > +	local kernel_opt=""
> > +
> [ ... ]
> > +	vng \
> > +		--run \
> > +		${kernel_opt} \
> > +		${verbose_opt} \
> > +		--qemu-opts="$QEMU_OPTS" \
> > +		--qemu="$(command -v "$QEMU")" \
> > +		--user root \
> > +		--ssh "$SSH_GUEST_PORT" \
> > +		--append "cma=64M" \
> > +		--rw &>"$logfile" &
> > +
> > +	local vng_pid=$!
> > +	local elapsed=0
> > +
> > +	while [[ ! -s "$QEMU_PIDFILE" ]]; do
> > +		kill -0 "$vng_pid" 2>/dev/null || \
> > +			die "vng exited early; failed to boot VM"
> > +		[[ "$elapsed" -ge "$WAIT_TOTAL" ]] && \
> > +			die "timed out waiting for VM boot"
> > +		sleep 1
> > +		elapsed=$((elapsed + 1))
> > +	done
> > +}
> 
> (This is where vng is launched and vng_pid is kept strictly as a local
> variable, which prevents the cleanup() function above from falling back to
> terminating it directly.)
> 
> [ ... ]
> > +check_guest_requirements() {
> > +	vm_ssh -- "grep -q memory /sys/fs/cgroup/cgroup.controllers" \
> > +		|| die "memory controller not available (CONFIG_MEMCG?)"
> > +	vm_ssh -- "[[ -e /dev/dma_heap/default_cma_region ]]" \
> > +		|| die "CMA heap not available (CONFIG_DMABUF_HEAPS_CMA? cma= cmdline?)"
> > +}
> 
> [Severity: Medium]
> Could this result in a false positive test failure depending on the guest's
> default shell?
> 
> This passes the bash-specific [[ command directly to SSH, which will execute 
> it using the remote user's default login shell. If the guest VM environment 
> defaults to a strict POSIX shell like dash or /bin/sh, the [[ syntax will 
> fail with a syntax or "not found" error, even if the CMA region exists.
> 
> Would it be safer to use standard POSIX [ -e ... ] instead?

Yes.

> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com?part=9
> 

-- 
Eric Chanudet


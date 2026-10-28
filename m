Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153719;
	b=vJljQyrclUWp9yRdmCASvwELdObJRVQHH8VkqawPn1Z1cXf79xXyePjCsCqLPc0E7fc0
	 vd19YglMlso2/hE6CJ8aBlup9yQ2VwYX1xzeU6bFf5RTpIG50RtWFaAU/JHT94WmqmEcd
	 RX4olMe4hiupCI9lxZQ15R60mmeOMQRNbFCVxENos/B3wlQkcWvR4XJQYplu0eBaqAGCd
	 spEWnFU++OmHLazW7IWGZdO5Ju4KLA1Bs8uZbUF1P5mBzylszTKqLnVMbjsbODfQaTdM6
	 o3zbFWpc/EGSVLG0NJQDopbAsnwv6N1171L7fO9rxjThu4vCl258tnwtqJKjM7Px7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ythJh/XEdjQLlBAqu0wTk+8zuvCWvmDdvt1JWCENtkM=;
	b=lKSNAiWIsgTlQ/mrp/qGAt+9xvfBvgRSG/MiJL93GbYAGgo1iN0FDM4rnhQnRm0XSqZi
	 2fGrfn7Gq9xl7bRFQ87eNoa9ji9GGZBontSRLamTyOCBxb9+Uy1elIRRPt7GqiW7uWuGM
	 gmx/7Vlvv01lPJDndLT1Z65KN0NSbQXfq0q4ncwRhclze1zLQJyvwGZMDV21pWaFYBtDN
	 B4/+tG0VM9znRHZd6B4LoxFTZ5a0NYVFTo+lFEub36ZmJJcgZuLs8ZfMpeFcwOE5+pBGN
	 lUjE3Jm31m0urcoODIpFVPMLdma5Ij2LmCs2nBT5upBsJ7bv8SkutB/zqhMw/9EjXJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMZNLGff;
	arc=none smtp.remote-ip=74.125.225.74
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2808606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2808606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMZNLGff
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48dea979eb9so207000f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153717; x=1793758517; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ythJh/XEdjQLlBAqu0wTk+8zuvCWvmDdvt1JWCENtkM=;
        b=RMZNLGff5bUVQhjpwS4LLY4HAvhcMxQPkv6KGfqkAxZvoB26sU14d/4oSDGxpy+R7I
         DOMv1oQPwG1CdP5LqQefVQ+GHJIsTPY+NzXStln7sk723wVMR0P5HhsXGvcsw5ZeAB8u
         ntcB1rMrB6V49lzxwK7L0F3zZWRssScFiagWU9BOPVoldAvGPTBxpUhbzQo3brx0c21M
         kAwhy5trGtD+D8ZpCHjiCccKXOLcfhX6XFDooyNmLKLUBbObCY2bUvmumnG3RcFCYnwf
         Q/i6fbVBBErUu2CQUAFnvecUBSigrgtKM2f7xAsb53n4/BqrrFsghERDN5Lhx/MXFZFl
         CGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153717; x=1793758517;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ythJh/XEdjQLlBAqu0wTk+8zuvCWvmDdvt1JWCENtkM=;
        b=UJpBO/mc7XfF01O2L8WYblU+LgxP/CP3+OW/bAQNGR5Qs71M0mtbrqEEZSr3HITyq7
         AYkvfytk2bNpFseYG9OgRNh995bFiVvnYfS27udUjj8V8FOy/XkFRDwBOw/vqAwoxoD4
         Kneb9L/hJ4COK7O8qV6kh2TNKgl3nQsXUO2gyH3pAeZ1XPe0VTXtHMSkI8v/Mew70Ev2
         TaYSAPaZjNlYD0+P5OnZC6zQn6vRZL+ECCOmMelxQg3yLhN672DHnIKftTl+9X6ohIgc
         y9bfd++sbvgDrYm0+CJkjDSD3EzibVdK2qiImI8FJSRqjDwPk7CwOKInPLhXmlTvIQNl
         qYPg==
X-Gm-Message-State: AFq9FYKRPpM+tweDGS7MK+QgN8tu9qlMJtowCSH8pHlN/6rCWUTtW8Z0
	a/rm1L8X4DxxNcdmuuaYm9YEKeTwnwE3tlo5N04wQeduSxGFUiTSTjkLD4P0ncEB
X-Gm-Gg: AYBFou3ITyO8bz4b70ZuTD5R30Wsdda/WzEwc8h2e4q5vjdlTqUtfLd9Q8CRpuvsEDE
	0c2YFgUzdN6xWu1MF/VNX1MbSk3AfgYxJcYN8e8dD4nuTm6zfoP990m8ebqWn/qd+riObr7OObg
	0CTgGSh2YHmYHjDHGaKQ7HDz8orxIcM679tFYftktqssXyFSXD8qmFGWDKvxNYlXwFAwKE+AKwt
	alP2i6mYld+PrefyisE/A/7574fIlQTcPiFTffLmV+AkXuAWOqUY+1gwNTO94rdfld4QPJZOPtx
	0Q0CFlTcOWE5YU/QkI7995wfqYRZITYUeAcjKOedOand+cW0b0umVjM6CtiN5AdEQPhlKrSUt4Y
	CQ00nQ4kWgnGNeuMBBdz708otOD/2r+hHy7RhYQEg4hRoUldk1WqMsGSeoxy6kAUKE6NV2zjH7w
	5KFj3Yte176UZoPO5JqwriMXVyljsX8iJy/ioh5fbDTf3YIuTBFGh1XL/ubTbh6L0goa3l3WyGF
	5rx5oFvMPa+J6FHTy3q06cUQTyxHivwV8kIhacT6Omd8R6B6RdfhLKB0w1S8xXik6SoTXaz2Qcq
	9H4aFzpXepdnuddRNKfEpXU9n6MJ71m9UxItOMljEsjaqZBhMb0Ic+dx4VEANJlPz/olFjOe7zh
	nnfHzdLVZR5olU5e4+YNUkgMo+gBQQcZJCB5jrm0AHMvvZlBTm9r7musbt46hZ4t7/tqr
X-Received: by 2002:a5d:4bd0:0:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e5d5a3f0emr1828576f8f.34.1793153717206;
        Tue, 27 Oct 2026 19:15:17 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm24586614f8f.55.2026.10.27.19.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:16 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 07/11] bpf: Let the callback of bpf_find_vma unwind
Date: Wed, 28 Oct 2026 03:15:16 +0100
Message-ID: <20261028021515.1203900-6-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187303@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <9b98417904ec1b27a1b6e2d6a37b897fe2494073.1793147364.git.memxor@gmail.com> <sashiko-outbox-187303@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Oct 28, 2026 at 2:08 AM CET, sashiko-bot wrote:
> [...]
> [Severity: High]
> Can the unwound pad end up calling mmap_read_unlock() and mmput_async() with
> hardware interrupts disabled?

A callback can return into the helper with IRQs disabled today, with the
flags saved through callback_ctx into the frame of the caller: the exit
of a callback does not check the IRQ state, and the helper unlocks the
same way on that path. The pad changes nothing there.

> [...]
> [Severity: High]
> What prevents the callback from escaping the vma pointer (or pointers walked
> from it, such as vma->vm_file, &vma->vm_file->f_path, or
> vma->vm_file->f_inode) in r0 via unwind_exit after mmap_lock, rcu_read_lock(),
> and the foreign mm reference have been dropped?

Known class: the callback can store the vma through callback_ctx today
just the same. Ihor is fixing that for the arguments of a callback, and
the fix has to see to r0 too.

> [...]

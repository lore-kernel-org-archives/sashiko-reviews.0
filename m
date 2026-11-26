Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703477;
	b=UoF2Vp9h5Ydo5/KRR7mJSb8kVuNX+d5TQxzZ4bKTw4s91u1P7VyJxXa1hygsqudIKeNF
	 dEpl/XKYFrVaAFkpXvaDy1cksNdMvSN2sbEaa7+h8oQZaXeUsgO08I1AeZB8llG9tZmKJ
	 XD+28GZ5X/axxCg+qOsgv46/7LhVvfKm7MEO+uJY5yelzrrCu1Wjbtz0skCKsgZXQp9rL
	 o0GltSCxcXw4pkPlpQ45EGvKwU7rIYoUKOTHuZMMd8pDn+1/08dQOU684lyGQu9kX8wyD
	 rDS2cvk8FPFO3t8/zIcK4xuf5hWV82+dYxMKc5Zdq8cmDmyeABoTfh0VqxG7HInqjCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=KTJ3uXdDrmXkUBWLJ3C8ElaGH6mAEKbpJmzM8ieOWYc=;
	b=zstCLJN7qFU31b+Ge3E86+2D3anN7znX+Ejcjx8+AOwKhnau86F7NbwI7Jqd6th+7Efx
	 QXZFB3p6nx0luTn7hpdGxOcX/A9tPslfvYqjLdVQtA1UkH2k61Jhcvbi14cM/izbQLl6U
	 IQdYbWz3anM/NP41jeYxeh1icCuSotq8PIOXSTjE0YTGMMLeqxJJFBDkl5b1bYtZlW4cm
	 ZpY47F3J+lT31457oghqT9K8SjNFYq+uTlmyjzbStWScZKx332O7arhYCJbFKEO3z17Lj
	 x2yiNiyKwlsKSWnww6gq6LK9fCLh6oHeGMoBUvmg/ZbUoFQaxWe7zf7NxvH72AwD01Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrtEJmMt;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE7606A699
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 14:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DE7606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrtEJmMt
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4442393f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795703474; x=1796308274; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTJ3uXdDrmXkUBWLJ3C8ElaGH6mAEKbpJmzM8ieOWYc=;
        b=hrtEJmMtwFRxha8cJu/ukvIh4CUR3h6Mg237Nwvb5xxBEGKJVtCRbz7mTEmJ6u6LCI
         +AvbNB5Mo+Ib/032frcfzGsOSmz6TUTRz5+LahongxTk/GyC0zF6zcbnPMEqR7SvXjsr
         j4FAjgcnQ8Xsydv7innI159aAKwhoSS+q/8/ZUyv/nxHu1x1U8KMwF5TdmHYnJcW1bjp
         PseWT8ncY05jL9a3icmOrX9hyrOHaEqhl8cTo7ydofasvwJtH8DsXDbKxK3UKkRep9Ju
         tguZ/PrGAKB1i5icaA/tBC1MEVY+hlbSTIj6IDcICxbX/fniuc+TP/9c1OzS86FTWYb9
         WGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703474; x=1796308274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KTJ3uXdDrmXkUBWLJ3C8ElaGH6mAEKbpJmzM8ieOWYc=;
        b=fIldw4HCKSRbfPjjeb3WQEIJFYKK0g+qZaHb2Dqb0qYgOzcdIiwH3FRHATaPpTIsH1
         VoAfx1AdOLRp8aj7n6CwAZnbB6BjfNHGb4Pqn3of08o10ymcSUeq5fjzFcXfVZZXGnbj
         TMXqC2nd2DC8U28QCg5gNv7FF0PQ5SyXTnu+m7zZgSus52eSPzJHVj96jXbENfAhXVm7
         G4CBvrD7vzfImh+ZQ17RribLa+tnLhSi12FAonmgC9hV31Yzf0p1Te1xTMrdR6yPapPM
         7hWshqebbVkeWyCjKhU1GFqNw/8VLFAWa/DwM7urY3uXBrvRORjNe56lbbV8Fsfpi7Bh
         RpGA==
X-Gm-Message-State: APuU4Z+6JjQiRh6Wzf+Ftw93XoqQFHeQyG430qld8gOnQbCK5V4jMAAu
	Q6qJARTIa7O2uDA6lmhHiwl6VHgqWWZa+BWWfBPKL7MgKUch8RvOLOeKQoO6IA==
X-Gm-Gg: AZFdTZeWZweNQHNv3wskX/VssRtbWXDT/Blm6ERjzpbNVixKZNOg4noQXs3bwRpZb5d
	dNnemc9XEoom6dZ+8zXUDeaNRBmpYwyZdotyWSg35eiD/pySkAyyI/jKLDzr5R8F/uo3CaVa+zl
	ka05fLIn/cE4fcqJfdBdIf89dk1hl+OoUTsUCBZuf7kbBtF79MHhw1r6BiU38+K3C/2yXxmvkbT
	E3KHdfCUg9sV1M+yESUSA8xem73osxXiGMDRcnb7KMxGOPjCQUBw81noaIV1St3X2qAyuY31Imd
	mbJClNGPpiEWPuHt8NCSwz0oexO24nO9UwivWAl4th6VWZo+JO6KEhbFd+qMBlmVTfHpnXFBA02
	pkPq9DnAQ2hlw3YKYy/sG++jaDT+kC6u9Nw73QTbL1QkiZa0pFvVqilN1GlLEc9dX4yIFw4dyaQ
	QBKMwB9qkn9xZaFPgJPZvPW3QkXQAmkkv6xHWptaozPoHDLCv9p3O1AcyFVA0koBifuJhBNTMJ4
	igHfE8sMrv25gkNZqxecSc0E3+BAZ7DAwodjHHE01w63jSjDP6hM1mgMAMxxEz4kYk3bF4YHU8C
	RPE8dr/AGDTNpi3d2GkyZAFCfStztQgk5m5Z2g==
X-Received: by 2002:a05:6000:4b1e:b0:4a7:150e:cfe5 with SMTP id ffacd0b85a97d-4abb46bc772mr38698916f8f.42.1795703474305;
        Thu, 26 Nov 2026 06:31:14 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm32157631f8f.15.2026.11.26.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:31:13 -0800 (PST)
Date: Thu, 26 Nov 2026 14:42:50 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 2/7] resolve_btfids: Do not tag functions
 which work on BPF objects
Message-ID: <awhFakVOoCYNR0T-@mail.gmail.com>
References: <20261126142915.1106330-1-a.s.protopopov@gmail.com>
 <20261126142915.1106330-3-a.s.protopopov@gmail.com>
 <sashiko-outbox-235703@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-235703@kernel.org>

On 26/11/26 02:27PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] resolve_btfids: missing Fixes trailer for fmodret_tag() BPF type
>   exclusion
> --
> 
> commit 22ec6a5284d69e95482c5c70ca4fae778848a0da
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> > resolve_btfids: Do not tag functions which work on BPF objects
> >
> > A program on tracing_iter_filter() which returns -EACCES makes the
> > verifier miss that a global subprog throws. A function which takes or
> > returns a bpf_* or btf_* type, or struct btf, works for BPF itself:
> > for the verifier, a link or a map. Do not tag it.
> >
> > __sys_bpf() loses its tag. A program can still deny a bpf command on
> > the syscall, which is on the error injection list, or on a
> > security_bpf*() hook.
> >
> > Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> [Severity: Low]
> This fixes the tagging of internal BPF functions in fmodret_tag().  Should
> the commit message include a Fixes tag:
> 
>   Fixes: 4dd950adacad ("resolve_btfids: Tag the functions that return errors")

I can add it if robots continue to complain, but I am not really
seeing why.  What will this tag signal?

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261126142915.1106330-1-a.s.protopopov@gmail.com?part=2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663297;
	b=LyXxCiqc2m9J7YDeduvyzhTHOSdvHMT+xma32kElr6gP4jmqcK3j+vsNdNDuafCdacII
	 gKrfjCBtfff7ozgEGj56xU1wf3RhqMuoUIggbbOFjNkBwKY72FAwxSS1+WlE/GttZgDBv
	 ITEDlx17jQPntSetwsG0owloWx/W1PYcEVl5pxSkIYXVmJ/8YG7TruZkN2VhVCnh8lt29
	 vdCM5aOjRXqE2FHFRzz3xSCTAa720R9C96DTDD/JYSdJdmbpxC7kK/qAc7fyts5ccWc98
	 BPZoefIPIchvNwSMP4DQA2Is2WAM6rQPMdXj8yeOASe0HYnWrLB7No+2WvnzinIryaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=iITVNj1hA8VysTM3SegZsQpdbGDdaeAWi8dvud7vL4Q=;
	b=4IRpVLfbiN/ZGQyc4SpQVBABvB5TCGFk0QKR74cOQ6G2/0B92k6IFwa1KrpeB93sv23v
	 aVyKN39Pn20h15zm4sUpuFECAuGWOS4ZoEE0uDuRFIXHMo5+Z5BHRSAhzXNy0nTc1jCHA
	 vOMyFt8zUc6z5jfxFbIsu4QKOBfYk4qvOJSijhJMzK8Ar8pZKZERLlfNAPPrQMz35R8+5
	 JLOYKS1IgyrkLJVjqpbrfQujRvnjUKwLYVdXdK01uZpwTQRXF/TQ/IcUOK2T483JqL5mq
	 5oVkwv4E76rPljn3dPjapQ3i7TJOdLw32VvdAdE/v0wnyJbRtJ3Y8Uth046Ant7Wipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i6tHhzXQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064F606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 13:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2064F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i6tHhzXQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24017955e9.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794663295; x=1795268095; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iITVNj1hA8VysTM3SegZsQpdbGDdaeAWi8dvud7vL4Q=;
        b=i6tHhzXQ8oMJY9Njf7t/l0MGrIEtnepzdwP29FCBRq6cNktLBCtPYXwyBELc9UV4pg
         i8aLH/yIDLJq1S+67YnDXQmFgAP7V7a585wNHmrBlw8qZhRtPSJzNDz1EcSO2Ss8xYUn
         6ThVn3Rafvn60ixVzSi2RfsKsFOgpVuWXIU3jMyxclu92UP/F27JTsg+aLH9uwid/PaU
         2L1tXa1IYBL29zQlF/+kjVdkHOW+xoS5Pd/7r7/8b6JrqdB44Miljym1TFD3tb8dpJNx
         /2iN4lvXyCDq/X/m6FC3mzsKnccVvUM6k4NH5DIPVWXaFi7UUYlWpByBAl5fHUMCSBJD
         Jsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663295; x=1795268095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iITVNj1hA8VysTM3SegZsQpdbGDdaeAWi8dvud7vL4Q=;
        b=ldCloNFUU2tw+fDRgYLScoxOl7vg6jbWuE2F3IT6GpdZB07Ach4s/GqDOlNsKjCt7Z
         mzOuVr9HIKr3Pwi4CWTqIV20zBtmq1ocatreBgdEmqet1kdnBNKei0WGEC9SZr79BJ4R
         ODPVQM3coZJnhBKM9tCq3dElpaPcno5zqu8qYrn6ag4Av1oEd6tz3uhxugpWlfVpMCdV
         ekElUFf4HbTYtVWywilH+0yZHEndla8jj0c9K/eMcA0Bx1n7YmWnC5PRfWWFg6JTPQY2
         gdHmzACNV8b4DN5f1Vb+THsea3o/cedeO2Dm6bVjTu1VHbQMfEIbkVIgQ+Kgv805Z7Wg
         9klQ==
X-Gm-Message-State: APuU4Z/2ZgaYQ6PoIYTqrvEJBcjALnoefKijqBEfRTDpcLfflB2Yy861
	b3Scd+dVTEuhGAqqtdoL48m0qlXbUWH/4L7gUv4PfffMOcuLkxcXdiQeUA2WvUGCpY2bcvBBC6E
	/KtozoQ==
X-Gm-Gg: AYBFou3dPxboZyZBIvlfoef1k323CTawH9pR5lCAsz+5oC/Q0zHal1u+Ru+EMoEz3S2
	qOt5lvdkPSHJJl3H0bjd+mgzpGFZ08i70gPuh9aa7HCYYq4Q3vmfQasmwdVUCfmeqw8nIPgp+C3
	0k2SvplHbOPXHW4iddeAIIbA775HwEtluj3wcIxBjQZHc0pQo+4uSMuK21HwRB6GAVP8oFT3hyr
	rbJP0DLRR7N1ocSU4SVlcWO0zZvPPl5GH9VilzazDwmGvOjVh+ekO2OAxZ4xnC2gJ4zrwfZiu7I
	d+ENDuE0aMsNAGPKvuwD+fLSLCpb3YTXmsHUG3D+jDXjcyirTzILErdJKf0Ck2KXUxd0sZAQ7d4
	4hwtd7rdJa2wcxF2ToWfiRp7i0HpJsjWn4JBBstvHyUDxr3TAFXA8f97EEx3HXyGT1COt69p3ZQ
	UEpgxzXmYquY/T6y5KGPE/U8HSScG6yg2kegVJqsd6UQFKD6ixugz9I5pS5iJnzTU+lNvqDYe8J
	pNk/NpJGUC1JmqXw+6ZYTEts35XXUQOwilFHJGcnsnPdcVLEPajwPbfPKYfJirfxWiuOqVMtsfA
	b/7EANbVFQPc59gAQNfS9PTSz648CS2e0CRAjfYIvyzfza00BnQucIy0D31FPFdBtA==
X-Received: by 2002:a05:600c:3b9d:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb5dbfb103mr85932305e9.9.1794663294856;
        Sat, 14 Nov 2026 05:34:54 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm237952865e9.15.2026.11.14.05.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:34:54 -0800 (PST)
Date: Sat, 14 Nov 2026 13:34:50 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ring-buffer: Order remote page commit with data
 and timestamp
Message-ID: <avhjevfc0CuHyvWv@google.com>
References: <20261113152729.837429-1-vdonnefort@google.com>
 <20261113152729.837429-4-vdonnefort@google.com>
 <sashiko-outbox-213099@kernel.org>
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
In-Reply-To: <sashiko-outbox-213099@kernel.org>

On Fri, Nov 13, 2026 at 03:34:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] tracing: out-of-bounds write in simple_rb_reserve_next()
>   [1]
> --
> 
> commit b0c88540d75d93c7a85149df8d188a1bfaa9a89e
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Order remote page commit with data and timestamp
> 
> This commit adds memory barriers between page::commit, page::data, and
> page::time_stamp for remote ring-buffers and defers updating read_stamp
> until committed data is present on the reader page.
> 
> > diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
> > index 5f14ba152fba6..2dddaef638dc6 100644
> > --- a/kernel/trace/simple_ring_buffer.c
> > +++ b/kernel/trace/simple_ring_buffer.c
> > @@ -307,6 +307,11 @@ EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
> >   */
> >  void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer)
> >  {
> > +	/*
> > +	 * Order page::data and page::time_stamp before page::commit. Paired
> > +	 * with __rb_get_reader_page_from_remote().
> > +	 */
> > +	smp_wmb();
> >  	local_set(&cpu_buffer->tail_page->page->commit,
> >  		  cpu_buffer->tail_page->write);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can
> simple_ring_buffer_reserve() return a pointer whose reservation overflows
> tail->page->data [1]?
> 
> In simple_rb_reserve_next(), when an event exceeds PAGE_SIZE -
> BUF_PAGE_HDR_SIZE, simple_rb_move_tail() rotates to an empty page where
> !tail->entries is true, and event_size is assigned to tail->write without
> checking that it fits on a fresh page:
> 
> kernel/trace/simple_ring_buffer.c:simple_rb_reserve_next() {
> 	...
> 	if (unlikely(write > (PAGE_SIZE - BUF_PAGE_HDR_SIZE)))
> 		tail = simple_rb_move_tail(cpu_buffer);
> 
> 	if (!tail->entries) {
> 		tail->page->time_stamp = timestamp;
> 		time_delta = 0;
> 		ts_ext_size = 0;
> 		write = event_size;
> 		prev_write = 0;
> 	}
> 
> 	tail->write = write;
> 	...
> }
> 
> Writing the caller's payload to the returned event pointer then writes past
> the end of the page buffer and corrupts adjacent memory.
> 
> [1] https://sashiko.dev/#/bug/linux-b2128783-1787-4f13-b863-090db5378e74
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113152729.837429-1-vdonnefort@google.com?part=3

There's absolutely no existing event that is big enough to a ring buffer page!

-- 
Vincent

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488478;
	b=cbk45m/ZIfDOIjrsjBdeJUqWxMiOq4ORi/EdajB7UAMj3Nfvh6C4Z/z6hjXU2wS4Hs0b
	 Q5J+pyMk/cQQMX4qqyjC+ph4Tv18V3CME+kzNQbmzL5iI6hDWQm87coNHzHlJX4C3AgMl
	 xyiSb/RdqX/1lr/eqM1Ra/fs9aSYqDzWzJLCr98bQXfJvWVBP6xx/9IEWWKTCUFAJKuwT
	 D0p8+4HVzjCLiM6vvnCSj+fLcHB2hKc0juypCf2+odJtLFmX3nyAoHopaUdXUuF8sKu2E
	 vpjNqKJeL/+HXsUgXsDreGatqm/lEUFGhoCn8xmJHjTp9DvgP8M8t1u2t3/2tY0VzsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ilyoWL3u+u9MAiM1YKTDYfoFOBlZSFdY+PBZMMv3M0E=;
	b=2rJt0V+cj8e2C3ArQj85cdYOoHo1O/29/cuuwXjZAcM+kQN45KPfvyVjrIReCGm7OVcu
	 h8GrteUf0su1DQRG1ApKJt9ME5RIZziqtXpFyoAhqfZlMwnbaMS9bNv/nJNqGdw/VVIDa
	 PL4jTFYBlyI/efnzFBnpYAqICFeeAbvowJtqbZ7GMUMJwZR40cNebUvHZhxxMx5uy8c/g
	 dNpKULwxyyYvQnG21bR94oag21kbDLWZ+48WoUEUkEfBADMpN5ikzZtT6S2eQT1vii6qj
	 pRF53Mg/eP4U5ZsbPfdkSUyNPm48FptE0HJIJnk08lW1Wc2dw0xqpraSXhNwCk60Teg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CF1IInOt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC3606A32D
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 13:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CC3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CF1IInOt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so33807795e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794488476; x=1795093276; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilyoWL3u+u9MAiM1YKTDYfoFOBlZSFdY+PBZMMv3M0E=;
        b=CF1IInOtyN8Y0b0+oNMXfG8ZHLDkVG/Cy94SSESIH4u4lpG8YduRVeqq30gzMDQjYa
         1vRvDc04LfE8laiGZWd3XaL6lCsNB17LPpPYkw3PmOjxJpTK2YZjMDKmzmHd6dLVAisp
         yC+AV3+Wf9dEbthy/axb48v2UBzHMU35vRtrOzabtPnL5BNaq6nws///mYYdtlkRP0VP
         JXBjkPF/U5arlatj2f69MQ81xLOokEoBD/F3l6LtyZ7/D2KRwmcatWTn02/vFD3ILw+m
         uTKYoJRw0Ca94Be6ug4Kt7zDWY+SKO9zYZWNa03k9TPy9yfPEa+W6Ho/Ud4WkeJlEUmT
         HYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488476; x=1795093276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ilyoWL3u+u9MAiM1YKTDYfoFOBlZSFdY+PBZMMv3M0E=;
        b=ybbNAfXaKi6vxbEHW+xRwa2JrWN2stP52WNG3+sl1y1hyECGFtBPz/AcoZgQo57GKc
         +L6MnXqgMy0uWhcM0+JtVgqlgmjF3rR8V9kL6OCOLLKc8G4veJiGvthUssIzDYGtHQ0T
         GlRwO8grwkXYNjcLYSR8v1fJSudIMUPjsYqW8BSOpukQ56bb0fXDzD96nEnp+/VSyHnL
         bTC6SVs76GKDv+eaNAQnlN2VPGAexDyv/LxEDNvG9qk9g6yrPQYkg2MKzD00856DnpxU
         BSzASnCtjjnh7cZ+zmxJpk9+EPrCdBAFe/IIjXyPua+5Way1XEi4MbvXEJ1lrH/1/Akj
         bfiA==
X-Gm-Message-State: APuU4Z8B83C1GgCTrtIKy0os9/dUADGeTeWahqInonXCLxlI3zFtVTNk
	x46DbZCNg0q1Pba+lJc/s0uQ76thG3dtO+bFJk7xz+VX/MCEtwAnMshNMehPe2thPqU8DaRmTLJ
	8ZPbsMQ==
X-Gm-Gg: AYBFou0p1e9d+WacYsZSQ+dqZO7TpTjIUjtcRcwFCPTimRjrTx1FOhGx7CyKuIXHH9F
	k58LGo1+vFmx1UYw3zkMSLMvzqQWxyHPGi8yvM99doOs84sKC6MIY13aW+k/5MzO5PKIxaOZvvK
	WWHeFNJe6bR7ImWvXJSeKi61pc960aaddxx8WsTlUy1jBZJBNKuI5LsrSe9tDyfELPfkBCyoVL4
	+M/QNdqR7x8RdFOScmn0Er3ckeviZqv1X9eYKEGovwNvE1nfyHUQSHIGNF7VVVs832bxj0LtEfD
	pSpShwoTKq7mV1hzlwxS8MVOoyE7Rrs7BmzK7vzuPHhhbyQPfUUKwdfOANxW6+Ii73qqL0IbVyk
	7pv+mB6MQ1ofwL2Cr/oUomcTljgLiBjBJ2rdAIbgxND5rGiPJEnpTGrCYnA/lo+ga188+mVgPev
	y2Tfnwhlm3tZYEJuEesQVXGiyL6XTgVDJZ8lOELZsrMc8E3mnWBGPPTHe7rHJ/PNRm+ppA9+jM8
	6pro0PfX0eG2EUIMvqUqBmUYBeNYb50KWhxJ1XLGtNvMOYpUix1X77cdaaynDHwyyCxKxsNhMoj
	l06JS3+InwV4ncdJvjoyUmZGFHu5OJmfkX1SkEpHJatsCqmV8cSjT+nMdQTkcDEqqdQ=
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4ba093811d3mr99267285e9.11.1794488475930;
        Thu, 12 Nov 2026 05:01:15 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251491sm71863355e9.2.2026.11.12.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:01:15 -0800 (PST)
Date: Thu, 12 Nov 2026 13:01:11 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] ring-buffer: Let the reader spin on head page update
Message-ID: <avW4l8AldZK62nJE@google.com>
References: <20261111160624.1294946-1-vdonnefort@google.com>
 <sashiko-outbox-209343@kernel.org>
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
In-Reply-To: <sashiko-outbox-209343@kernel.org>

On Wed, Nov 11, 2026 at 04:55:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ring-buffer: stale list.prev dereference in
>   rb_handle_head_page() writer loop
> --
> 
> commit 42f758b28dc946f5aa06647c36c046a615ee80cf
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Let the reader spin on head page update
> 
> This commit introduces the RB_PAGE_HEAD_UPDATE flag to mark newly moved head
> page links while a writer update is in progress, converting the final link
> to RB_PAGE_HEAD only when the outer writer finishes rb_handle_head_page().
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 1fd28a72e6ee1..73f31e6719f98 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> 
> [ ... ]
> 
> > @@ -3833,6 +3849,24 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
> >  			return -1;
> >  	}
> >  
> > +	if (type == RB_PAGE_HEAD) {
> > +		struct buffer_page *prev_page;
> > +
> > +		do {
> > +			/* Interrupts might have moved the head further  */
> > +			while (!rb_is_head_page(new_head, new_head->list.prev))
> > +				rb_inc_page(&new_head);
> > +
> > +			prev_page = new_head;
> > +			rb_dec_page(&prev_page);
> > +
> > +			/* Try to release the reader */
> > +			ret = rb_head_page_set_head(cpu_buffer, new_head, prev_page,
> > +						    RB_PAGE_HEAD_UPDATE);
> > +
> > +		} while (ret != (RB_PAGE_HEAD_UPDATE));
> > +	}
> > +
> >  	return 0;
> >  }
> 
> [Severity: Medium]
> Can reading new_head->list.prev and rb_dec_page(&prev_page) here inspect a
> stale predecessor page and spin in rb_handle_head_page()?
> 
> Lockless writers cannot rely on the head page's list.prev pointer because
> __rb_get_reader_page() and rb_insert_pages() update the forward list.next
> pointer via cmpxchg before updating the following page's list.prev pointer:
> 
> kernel/trace/ring_buffer.c:__rb_get_reader_page() {
> 	...
> 	ret = rb_head_page_replace(reader, cpu_buffer->reader_page);
> 	if (!ret)
> 		goto spin;
> 	...
> 	rb_list_head(reader->list.next)->prev = &cpu_buffer->reader_page->list;
> 	...
> }
> 
> If a writer enters rb_handle_head_page() in the window after a reader swaps
> the head page (or after rb_insert_pages() splices in new pages) but before
> list.prev is updated, new_head->list.prev still points to the old predecessor:
> 
> CPU0 (reader)                     CPU1 (writer)
> __rb_get_reader_page()
>   rb_head_page_replace(reader,
>     cpu_buffer->reader_page)
>                                   rb_handle_head_page()
>                                     /* tail_page is reader_page->prev,
>                                      * next_page is reader_page,
>                                      * new_head is reader->next
>                                      */
>                                     rb_head_page_set_head_update(...,
>                                       new_head, next_page, ...)
>                                     rb_head_page_set_normal(...,
>                                       next_page, tail_page, ...)
>                                     rb_is_head_page(new_head,
>                                       new_head->list.prev)
>                                       /* inspects reader->list.next
>                                        * (RB_PAGE_NORMAL) instead of
>                                        * reader_page->list.next
>                                        * (RB_PAGE_HEAD_UPDATE)
>                                        */
>                                     rb_inc_page(&new_head)  <-- misses head
>   rb_list_head(reader->list.next)->prev =
>     &cpu_buffer->reader_page->list;
> 
> Because every other link in the ring has RB_PAGE_NORMAL, the inner while loop
> wraps around the ring buffer until CPU0 updates list.prev, or deadlocks if the
> writer is an NMI that interrupted __rb_get_reader_page() or rb_insert_pages()
> on the same CPU.
> 
> Since new_head starts as the page right after next_page, tracking prev_page
> forward from next_page as new_head advances via rb_inc_page() would avoid
> touching list.prev on the writer path.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111160624.1294946-1-vdonnefort@google.com?part=1

Right, using new_head backpointer might be too risky. The prev_page suggestion
looks just better and doesn't invalidate this approach.

-- 
Vincent

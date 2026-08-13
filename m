Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF48471CF8
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637046; cv=none; b=JGxHIOwxQBcwJdqFDEI3YAC0RrYsSn1exMeWV56swWpgxV64CpyPoR0awfP0OiX7BIA7L5p46UAKihJyBVc2Uc3kOY5H5vOnT1CxYy2JEpEvQElhIPJ3yHzdKJ2BxozXAJQZ5anLXB5QcWFsb9zyRWm8Rtt7FOlfaYYaJWea4AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637046; c=relaxed/simple;
	bh=jQAxa+4NKPp2tyImWEswhNJEafeGChFMbHTtA9nfCPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExeI0vrTZDmdC3NqAYFtHAg1zh81S/cglEgEdu2hkwrrqHrqgUeTwsh3AktzsjJnKZs1I5YTtKBelDHLRcbk3HwHZSVF0aQwgNC/EmnMs0O4fclZZzC5FpsNuT6cAsv/h3V+r6Iff8QhgdPNa5q0mIhs70O4kJpRAws0z8uG3V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BkQYtj0k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BkQYtj0k"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1350241f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786637041; x=1787241841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uLFM0Ir0MaFZ+RpPPQi6/Ybfv67iG9IZASR0E277M9M=;
        b=BkQYtj0kVK+SVN32+PDWpb9hnU6uiyxseSIfKfTNtyJN0yD9V5pt8ZSwKgMWNsx0CF
         XFY1woS7CQVtkkJ4lKNIi/m+nVdWXntt0OixnaBpn6rrgQ3UcEprqC3wBHUZMGK2BSLe
         bCXnUj4sNYxqwB1HWbTbyXk5OMF8B+fIRh9FmEo+JGjSS2LQkfwtiZbm3PUSkw6E6zyS
         xPw4k2S3lZ3LUwV5Zww0D53s4JGUFXOP65vbwll5Tab1sqnKneW2Z3o/K+vb96zK5QiI
         zNUV4L0BwHX/BPY3Zj9eCVlqmbMU/7q6St4QHWjlbVjvaCPPQYKvM6aodJOxx3m7mYPK
         h3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637041; x=1787241841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLFM0Ir0MaFZ+RpPPQi6/Ybfv67iG9IZASR0E277M9M=;
        b=BzsryBv/5eUEut52sNDHVpAhB14gqsewJs2lgGKLFgPIsLLD8mMy9bSRMxMrL4V9xk
         KDonR5IhP4P5xDKlTd/KdOKqkkTgYDdqkmvdbeMqH/tOYstsNLHF4NRWSzWuJUvezdru
         U8w2Ikfpe+rU+UK7kkUNUS3Mc+86FlrSCgEIr9hpvJ9ZK871sAbFi0W1Uh8qkvRA+Dj8
         gxl5ucG5Carr6i2UFazaUmgmy9iVmz3BBN7iKkQRFPlocBHWf9JP4ubnnpgP/WjOOf6s
         mHTH0OOCkE3UbwJ5l5StrsVL7SZMozZnlzZXBfYS+BdEzRuJ0QMfaURxjAg+0/s/uTa8
         +Ntg==
X-Gm-Message-State: AOJu0YxIY/LE9dUn2MVZL88OYwtLuvu4+5iumSGbs/HE4UBxvfPXqLs4
	v8/8OZJEXXzh0tjQmMU+NAKNr+Znbm177Z3j1OOYxcD7YiQacWxe+Hia7BKOsbN0/g==
X-Gm-Gg: AR+sD11O/tN4Ufmdvka2sM+vdSQs+Xc7QDNt3ZGeyfDssczMeAmn+ALLlC62+YMENoA
	EBJYIvZSAqJyQKTcP4Ds+1PkPbCUDXduh48U0CmpDyrB5L656HPK5FhNu00HL86/A5oQcLpG7dK
	Yd5Z2xcM+jwHjEaivvoda6kNRK9lkgQIb2tia0wwHzdBEnsML1q39oWcOhgwFJQr/Fmk1GPzOEi
	qDwo9yOJsRxNIyM+k5V6CXrIn0goDzgOUltJhnG5tFMgW1eInHIqIb7IQuFWco8/xtMK7hpOgoa
	2Ecp04HLjyOKIAVpYq1/t525erduf/3I366AT9EJAxwnAL9DjjbVv0nNjAQR39v+OYL7ytBXzyC
	3Jzd7jtX4ptrfuy4HfqKl/vVSWvOE+i6di1dnJpwwXJEmV5eeRC5qDve+zWxEVRXpzQsMoluZ8m
	tl4QaQCuFI3iP0uYI95vPv+rHuHnRxoaJSGe5CBC2u8DVWcn2JFOlxpuQBThM0Le9gZLqC4ME+H
	9yE+Xgsnnr1D8uy/vt8tTyFcyh9J75T
X-Received: by 2002:a05:6000:4802:b0:47f:fb57:8c7f with SMTP id ffacd0b85a97d-4815a008815mr10740971f8f.29.1786637040228;
        Thu, 13 Aug 2026 09:04:00 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm403643f8f.1.2026.08.13.09.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:03:59 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:03:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] ring-buffer: Free cpu_buffer::free_page with
 subbuf_order
Message-ID: <an3q66cnL91nm5Hf@google.com>
References: <20260813131152.3589632-1-vdonnefort@google.com>
 <20260813131152.3589632-2-vdonnefort@google.com>
 <20260813135439.E42E01F000E9@smtp.kernel.org>
 <20260814004932.4bf99af3fd65e8132142d335@kernel.org>
 <an3qrsYnQJ7ovwhQ@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3qrsYnQJ7ovwhQ@google.com>

On Thu, Aug 13, 2026 at 05:02:54PM +0100, Vincent Donnefort wrote:
> On Fri, Aug 14, 2026 at 12:49:32AM +0900, Masami Hiramatsu wrote:
> > On Thu, 13 Aug 2026 13:54:39 +0000
> > sashiko-bot@kernel.org wrote:
> > 
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > 
> > > Pre-existing issues:
> > > - [Critical] A data race and locking mismatch between `ring_buffer_subbuf_order_set()`, `ring_buffer_alloc_read_page()`, and `ring_buffer_free_read_page()` allows `cpu_buffer->free_page` to cache a page of an old order while `buffer->subbuf_order` reflects a new larger order. This leads to heap buffer overflow and buddy allocator corruption.
> > > --
> > > 
> > > --- Patch [1]: [PATCH v5 01/10] ring-buffer: Free cpu_buffer::free_page with subbuf_order ---
> > > commit f550c0bfeadcc22eca47316e1820b4d91f6ef261
> > > Author: Vincent Donnefort <vdonnefort@google.com>
> > > 
> > > ring-buffer: Free cpu_buffer::free_page with subbuf_order
> > >     
> > > When sub-buffers use an order greater than 0, cpu_buffer->free_page is
> > > allocated with subbuf_order. Use the correct order for
> > > cpu_buffer->free_page.
> > > 
> > > > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > > > index 2667992f0aa29..a3d28b2e2c94a 100644
> > > > --- a/kernel/trace/ring_buffer.c
> > > > +++ b/kernel/trace/ring_buffer.c
> > > > @@ -2631,7 +2631,7 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
> > > >  		free_buffer_page(bpage);
> > > >  	}
> > > >  
> > > > -	free_page((unsigned long)cpu_buffer->free_page);
> > > > +	free_pages((unsigned long)cpu_buffer->free_page, cpu_buffer->buffer->subbuf_order);
> > > 
> > > [Severity: Critical]
> > > This is a pre-existing issue, but does this change expose a buddy allocator
> > > corruption if cpu_buffer->free_page contains a page of a smaller order than
> > > buffer->subbuf_order?
> > 
> > Hmm, I think you have to fix cpu_buffer->{free_page,subbuf_order} race issue at first.
> > Let me try another series to fix it.
> > 
> > Thank you,
> 
> You mean this one?
> 
> https://lore.kernel.org/all/20260813131152.3589632-4-vdonnefort@google.com/
> 
> > 
> > -- 
> > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> -- 
> Vincent

I believe I have covered most of it now... but Sashiko reviewing patches one by
one doesn't see all the fixes in one go.

-- 
Vincent

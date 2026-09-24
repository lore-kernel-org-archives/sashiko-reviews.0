Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B2047D949
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252868; cv=none; b=Mjyt8mwTYwtsxYMevJ5VM+4BGOazowJZesqHUOvW0hO52uyiXXU5mBGz+4BUU3C9JB1M3IHdYhbWskAbHyqhxAGQlHHVD461fBzZjlvRlsMO+/KfxJjTS0kBmTJKbJDIpyKXYlIAB6PZs/D6GJ2qvy25EQ3k5AB4GelwbJs0QEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252868; c=relaxed/simple;
	bh=wNjl/xCEtzlgT0a5M5KycCUc9Jdogae8+RmVUW7SNzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kv/AbOECKiRhDi9jGscwot0jMgrPoh3TICh1ZnxX7Kk7ZKueNcZRwBhjZK1ds7UOxRLlDFO8CeYfzEoQe7/5hJCgi+j5NRV8unORiDy23VVI/5H4TV/shQ7sxLfWGXWx0+zkCwqh6XQX61v/8aeiy4gGO6iN9s0p3wTF3tGF/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0Ol7tJf; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0Ol7tJf"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1167773f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790252865; x=1790857665; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVzT9rV6dRR4JNktA0r62hGHUnd9OU93fg81zd4qkr0=;
        b=K0Ol7tJfuIupkOflKqI4FQNejoC+/Den+IaKbu/odz8PeekXu9ooRRnvgSMHCU2MFY
         Dq335FyP4PVbMskD/MIpijbizKA2S8TGywag+RLUVisW/pu4kWC4sguZMVjpfBrYkgTT
         xCOvuVhbyWDbOD8BLnurw0PtiXeXMQYe6yybeeJjEV4UJLXoYaOs2eVm5vG9dmP/ptLo
         EGqU9RGAMILzNzwm3l5KCzBiR+EgHKtWau69kzYASSSUDdjlI3IXh6Y5MEukp4+3CRse
         VKGCgXXlJreuA5SEI8pH8hQ5cIGhinI5SrlxaK7I01wLXDDYdHYHr8T51Rl9dPQkygbc
         F/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252865; x=1790857665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oVzT9rV6dRR4JNktA0r62hGHUnd9OU93fg81zd4qkr0=;
        b=gxjS7pejtvM1H8xq8wQVmAzBnmjtjXuOIRX596DhLdtPeX8q3keU/ggSJMEiNpFGQv
         OHVxPQfQahuMfb8aoYwlQXM7jzogsztgz0i1hzfIbP7ufuU6cDOubSZOO3CiioWoXMnU
         sViMsEpvNgozNz4PPVgTymn+mYBC8JXbZHEjc36BNfnEuYYPHQi8P9ry1eKO0tvOe/5I
         4BJ4MhHq4CkyIrrEbcnyPx3hwzOyIdZUKc+25vdZdruF45fa6bU5IQ3bPRMEHVC/Dfyu
         Jvd+5genAccV1WvWmQ/W3BJSpsafA5/TiyhFtYIUToycP/rMyUoqYDXAzo6jWvBDWo8D
         YRdQ==
X-Gm-Message-State: AFuF++nalL0UWNkK/jX5G2Yv2HV0OlQlze0et2lzCz/Po7N1FSfUr2Y9
	743T1qYxeA9yjYhZDHGTmlHbQ5AJG8ZUTziYuc4WgKHwpg1lOmjBT3+sA6dI+mM56rbze6ovznu
	FEA94aA==
X-Gm-Gg: AYBFou02Ps1zUUbKI69q6t78Iw0zS1mWETUeCahHg9uJIPnfUVYxJxdSzpfSIe14T/y
	zs3+je9qu5wmSNMzyypxUTjAEn02seNCO4OA5sd7cVVFhNSRlCpMMiHBPkQPVmA8IE2PY0R678r
	bBziygFHfjCUws/qMTUwN3n+rm1zdEmB+E03O42NlXlovvNE4nT4/vIg7eYFFaig9pS6Co5VhA/
	RB0T8ZWUB2Hyc19U5+YU0F5rKP6amptZwJCcXxVMnZ+PJbTxxLSq+e95oMVkdi5ytP7MXYlHbiJ
	erj9KhK2D0PZlf05p1M1mnBMygwevzBQrMAnuv9luEn6cx33LFYFQK4PUTeClzWEA3xLVykfAgI
	cF0xihEC/GqDSh9gU4fi43wyc0IrJ4JLPrMq15guZB2sL0ozKHlo+qSw9/T80Q3ZWZO2vHShmhK
	4KjwtdEtW2UR53xInwlXue8useoopwPjbgXFIiqrua8wqBg6A0yiE1DtllT0v/E/+vAqbf3Z4Ea
	Bm9PYVnhJzGCt6WXuRQpfYtG84kKjGdVBJ/pqMbQiY=
X-Received: by 2002:a05:600c:c8f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fe66bdf3bmr38051355e9.3.1790252864624;
        Thu, 24 Sep 2026 05:27:44 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm63102585e9.6.2026.09.24.05.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:27:44 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:27:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/18] tracing/remotes: Use kstrtobool for boolean
 tracefs files
Message-ID: <arUXPG_V-EypPM9i@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-4-vdonnefort@google.com>
 <20260817141120.E9E401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817141120.E9E401F000E9@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:11:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Kernel infinite loop when reading an oversized trace event from the `trace_pipe` file.
> --
> 
> --- Patch [3]: [PATCH v6 03/18] tracing/remotes: Use kstrtobool for boolean tracefs files ---
> commit 2c1ad77f49e430730de7a438ec955b0c042628e4
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Use kstrtobool for boolean tracefs files
>     
> Use kstrtobool in trace_remote.c where possible. This is more user-friendly
> as it allows a better variety of input strings.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 0384277070b9e..0e4d41a93a7ce 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> > @@ -235,10 +235,10 @@ tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t
> >  {
> >  	struct seq_file *seq = filp->private_data;
> >  	struct trace_remote *remote = seq->private;
> > -	unsigned long val;
> > +	bool val;
> >  	int ret;
> >  
> > -	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
> > +	ret = kstrtobool_from_user(ubuf, cnt, &val);
> >  	if (ret)
> >  		return ret;
> >  
> 
> [ ... ]
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed a potential
> regression in trace_pipe_read() when handling oversized trace events:
> 
> 	while (trace_remote_iter_read_event(iter)) {
> 		int prev_len = iter->seq.seq.len;
> 
> 		if (trace_remote_iter_print_event(iter)) {
> 			iter->seq.seq.len = prev_len;
> 			break;
> 		}
> 
> 		trace_remote_iter_move(iter);
> 	}
> 
> When trace_remote_iter_print_event() fails on an oversized event and returns
> -EOVERFLOW, the loop breaks before calling trace_remote_iter_move(). Does
> this leave the unformatted event in the buffer?

I will ignore that for the moment. There is no oversized event and the remote is
a more privileged component than the kernel anyway. 

> 
> If the event is left in the buffer and the sequence buffer is empty,
> trace_seq_to_user() will return -EBUSY. The code then calls
> ring_buffer_wait(), which would immediately return 0 because the event is
> still in the ring buffer.
> 
> Could this cause a CPU lockup where the core infinitely reads the same
> oversized event and fails to format it?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=3

-- 
Vincent

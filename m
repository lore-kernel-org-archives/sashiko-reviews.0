Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D81483BC6
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630843; cv=none; b=n/csUk2EL1doBx2EV8/n3jAlhKaDqA0GMf/Rxyb5ddi5ISTYgQKbHlrog413GBmspQUkUR2H105YPA/FIqmLSUY3kLmtQfqAFsnSDyN6WzaiUaZJoKFnRs+lhiGmHB4EQNZU5JGqvaSFwOcSsAE9fsksl+tRuB2gTC7N4iA6TXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630843; c=relaxed/simple;
	bh=BKkZHAxbqg0Xvz3ay8iJpo5Ks0LapLfKRR8tWj7WlVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQROomRBcL90MDBds3R0EYnyN+14Yt7EPyT2eN9W4iX3Q9FmRmz67wJCpoXU2ZFEYP8wmfzJ6UfpKY0dtassYYfRrA4/zea73CKkzMvKksydEFRr0UVwU2gMWy8kvTXVuEMkuQKA1Rg3KAdOPhyPtmBLjtuVlYkxHiQX2Gf8AEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AweV1fbd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AweV1fbd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso10609575e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786630838; x=1787235638; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kpl5xwcJLZQQoBi2QcazQFcRB+AFZZkbtY/pIHVQKyk=;
        b=AweV1fbdfxfmx8XbN6Gfl1WTtF1wGkS5pLGlP3T+x0DyV3Ac5KcPeR9FBsGt50Pij7
         V7QTX8RY+HlwMBxwL//gY7eRcEUqEPYzpdJXZbBqAMOronBijv9x+pHlz9iAhkari3xY
         eZRPmHJO/Ll7Cjl5peDt2xH0q4TvFyFqqOFi8j8R6/pQXSJ9Tu0pi1jUKmSZpEqyDwZi
         b3zMUWbXe+0XmCFhOBHxTEPZTZa2lBeFxh/X/fObghursF0rCQAUcqzglIgpdZNWURUr
         qVA9Hn9EvEBnZ+NjaJZLRB4xnRur7CRyvWJeAfyq8BMl9+QYKTfpWdo3PYhPCjfTphiY
         ue+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630838; x=1787235638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kpl5xwcJLZQQoBi2QcazQFcRB+AFZZkbtY/pIHVQKyk=;
        b=UQ1tnqPsv02u2lmQviMxhg06x4qrA9nQsQRMoYBRbYaq8u4JiRDmkySslbiDH6PlTV
         zox0LozsI6Fznk2zBnm24G7tVdbXJ2FcXPpggCvUKGRgAwrzD+qmcTBelaSjz1jX82UF
         evD+NMszI57SJj6rl3udgd+/jtlFvPKUzu5JL9vy3p7x8wrvLNsAEHIQrutnKF2eOw0f
         iyLmFnaPOJuaAaOGgVTPr9hvqtuIT2T2xJ+C45ycZTpMNlYXVdWShpNVXm795gFV1Gam
         PIOR0OayDTzhAYpAuGDgS65iW9jaoEycDHJayfly92d/6CZsNTwem7D75BxCdAaSFJVZ
         z9Xw==
X-Gm-Message-State: AOJu0YxzMy6vgshSaDtzWj97/uOa7EY95zpWYAG7EnKVJlVhkr8zQBjZ
	Mfm6M84DWsWfTF3VLOIQ6utApPJDOAXp0mBL0gUiZQA/mtvatwEX7E3aWdmF5UDVJMJPasoAUmq
	i4niTXg==
X-Gm-Gg: AR+sD13OwhSH9dSUODXXyKtINHXdJf8MGAeSR6hpxbhVoiyJYreKsscfgsfD7VQBcdx
	REH66VumwwNYJPJTyimsPNef145St6X3e2V6D09XVi3tBhQMcOcDuOqi1QK8NezNNsr8gyGJbLU
	9IdPJW0UlMnC6r6XpxPsbE5U/PQwpjG+uuZSp+vEYHtoHmc0ShJrtnpe/9iZ4WjF21B/y+zCF7F
	6gMImD/Kd22gEuDJhyS+ZKM/z7f25fKu4ALseLP2tcafnrHomlu1wEWBrvbEykdQ8byZmbQCQ5C
	MEAuAXGDke+3Q9BmjyqU//cEMbKC/yeT2hS4PyI3fkd9WHGVbmANwqrg4etjqC4RSSIS3kdMPBx
	wZXHgJjts2jdB/o2GlMj5OuHKaqZxDjpbVT/3LbbY6fN1W4HBcFh5BfwDXubd5O4s7cqXxACzG6
	6vsaESLNDjYTCwSUWOBTUONBj0XtX76piiK/csSqglyZWle2MrDTQjzTtkLyeoHzQRc53Qg7S5z
	EIZGFmVSmEM6uz1YeNciYsulhqVmhIg
X-Received: by 2002:a05:600c:524c:b0:499:79ba:a754 with SMTP id 5b1f17b1804b1-499821add45mr79820975e9.11.1786630837322;
        Thu, 13 Aug 2026 07:20:37 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499821652dbsm67797955e9.9.2026.08.13.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:20:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:20:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/18] tracing/remotes: Add poll_ms tracefs file
Message-ID: <an3SsR5ANiiipIOl@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-16-vdonnefort@google.com>
 <20260812171304.A47D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812171304.A47D41F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 05:13:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Data race on `remote->poll_ms` due to lockless reads.
> - [Low] Improper mixing of goto-based error handling and scope-based cleanup (__free) in `trace_remote_iter`.
> --
> 
> --- Patch [15]: [PATCH v5 15/18] tracing/remotes: Add poll_ms tracefs file ---
> commit a661ee191c6d806ed0a716f67237aca890febe25
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Add poll_ms tracefs file
> 
> Add a tracefs file to configure the trace remote polling period. Keep
> the default value to 100ms.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 5536e0df43795..b1c75666ab638 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> > @@ -1135,6 +1135,40 @@ static int dump_on_panic_show(struct seq_file *s, void *unused)
> >  }
> >  DEFINE_TRACE_REMOTE_ATTRIBUTE(dump_on_panic);
> >  
> > +static ssize_t poll_ms_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
> > +{
> > +	struct seq_file *seq = filp->private_data;
> > +	struct trace_remote *remote = seq->private;
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	ret = kstrtouint_from_user(ubuf, cnt, 10, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!val)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&remote->lock);
> > +
> > +	if (val < remote->poll_ms && remote->poll_cnt)
> > +		mod_delayed_work(system_percpu_wq, &remote->poll_work, msecs_to_jiffies(val));
> > +
> > +	remote->poll_ms = val;
> > +
> > +	return cnt;
> > +}
> > +
> > +static int poll_ms_show(struct seq_file *s, void *unused)
> > +{
> > +	struct trace_remote *remote = s->private;
> > +
> > +	seq_printf(s, "%u\n", remote->poll_ms);
> 
> [Severity: Low]
> Does this code introduce a data race on remote->poll_ms?
> 
> In poll_ms_write(), remote->poll_ms is modified while holding remote->lock.
> However, in poll_ms_show(), remote->poll_ms is read without holding
> remote->lock.
> 
> It appears this could also cause a data race with lockless reads in
> trace_remote_do_poll():
> 
> kernel/trace/trace_remote.c:trace_remote_do_poll() {
>     ...
> 	schedule_delayed_work(&remote->poll_work, yield ? 0 : msecs_to_jiffies(remote->poll_ms));
> }
> 
> Could this concurrent read and write cause a data race, potentially leading
> to torn reads or violating kernel concurrency expectations?

Fair enough... I'll WRITE_ONCE/READ_ONCE.

-- 
Vincent

> 
> [ ... ]
> 
> Also, looking at trace_remote_iter() in kernel/trace/trace_remote.c:
> 
> kernel/trace/trace_remote.c:trace_remote_iter() {
> 	struct trace_remote_iterator *iter __free(kfree) = kzalloc_obj(*iter);
>     ...
> 		if (WARN_ON_ONCE(remote->dmesg)) {
> 			ret = -EBUSY;
> 			goto err;
> 		}
>     ...
> err:
> 	switch (type) {
> 	case TRI_PANIC:
> 		break;
> 	default:
> 		trace_remote_put(remote);
> 	}
> 	return ERR_PTR(ret);
> }
> 
> [Severity: Low]
> Does this code incorrectly mix goto-based error handling and scope-based
> cleanup (__free)?
> 
> The cleanup subsystem guidelines prohibit mixing goto-based error paths
> with __free() variable declarations in the same function. While it does not
> appear to cause a concrete resource leak or double-free in this specific
> instance, could this create confusing ownership semantics and risk future
> bugs during refactoring?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=15

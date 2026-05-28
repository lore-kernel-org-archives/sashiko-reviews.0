Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21DF3F0AAC
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973990; cv=none; b=qbzDTHUlB/v7KN71mIhCAK2d6VzQMGIaqy5lx0wQS8EttfsqG/RkhWfaPKE7On1PYBhFsXhxjNbqVF7sHigoiTJQdshwumNVLJ9lXjDipvEGZmk0duStyZQO+f5RqFzlf00ar3UnmZXbXe4Nz1X1oXuucS+AYy/dB8iAnhr07G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973990; c=relaxed/simple;
	bh=NTVHnbYBV4uXxWlloyC4TfvYryT/9v1X6TIIv7txj7I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFj0IPMEuPVjrtKhF0paaJ1WF8z4sWGjt7+2P+ie/tN2HMw7pKD9+rczlqhN6n+7gE4KZPOZKr1tSLKE+341qkbIPN8ZygKDgmaacPJ8Lg5hGzhFPXNKWThmJR/x4ITi32rUxE+q8vCN2bkUJE0PlLtLu57+lJh1k4vhWwZ7/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo3KwsbR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo3KwsbR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so51356565e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779973987; x=1780578787; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWleOhWDQKLYgEGGi+3bPvOgQbWXJGxbxjY3SEegUiY=;
        b=Qo3KwsbRJIbwyyPbp9r3mdxCR0vYvJEtuqhikwoVWNcnzpM86q2T68RuJ4YHLebV6c
         dnFWVdaWBRv1ZbPUFGG+KnE1B06feJEUydZfLjfnspXUuWLd8FSu3TAr7hFto0Jr4VJ2
         uQRt7pH5Sf9Jb9KgtbXHaW53O9LPsqMJ5aRo6PbCEdY4S6Qh28L1IbaOZHv/PKvzT/g/
         aJUB28cvL2jJOrkFk4TuKVbihrEDJDOKkleBVhW0craaaSaJDFFC7g+XIltkbZJ8yH9I
         St9xRu9wyIvely02Uv8ts8V6rHcHsoNaonR7cbEcrZgtQM5+xNaA+p1VXy/hNXCNfjIf
         u6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973987; x=1780578787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWleOhWDQKLYgEGGi+3bPvOgQbWXJGxbxjY3SEegUiY=;
        b=WeGqjWjHmaBBFOxJg9sYJCb2F7O5jJGhR+a3BaGzUP1Vg+EXOLRVULOxGN9DhDnBMD
         Q0DzRMJhk88QsF+D63M7D+y59QNXMbkhDlTSIlYBxKgw+LGCpMg8r5HHjtmKMYn8BiuE
         w/W0YZZRaWUfnam8qlXpwXgGBRhNtfiVVWxwv1QkmxD9vJoVboeYBLTyQZnzjYE17xgj
         7lLTlwmRm6Uv0bTscwX69UKWmL030pu446zr9xqUH/Be4XUJGHEfVPPipH7nhIPj4XNM
         gJEjfWmsSgk9bmgh+rkOEvJ+xNpkDY200SkSGoU7+1daikwcqFUg+ct330E31IBAJvcN
         pDPw==
X-Gm-Message-State: AOJu0YzAo4m9fhTlEVzSGpB9JpfHGIb8lWIlSg8xdHaIj7NmifXGqr8y
	+TjJMHqFy+UwOF/X6Wfv2CzWpRPrBx4dmlg/xb6DRZbUFPYbVO17n/54h6uoVg==
X-Gm-Gg: Acq92OFFbtA0jEjrz/YXPx5w8OhFnL61zRUeeqze411Vn3YKkf6ovj7chFBmQsa0KNb
	syYBJrswuIF2WYL3TLWFDEi/4e4YsxNNfOc8bqq+jgmgzdQ+kMoCLrnpyWZcYJflzIlQkkrOmKE
	b8QqGN1+J5p2KKXGyv/oQ7VUBhNaknbBJb1m3JB/qmz9G5Kuzl02BtsPaFGYaRjfXXkCKmcJnle
	5hpPoHNzwHxHOsWirQ30GLAxaJhnlYVt+76Wqf40x3FrdiNkE1dQ8uSO7NF43a9W5ZpvcKJmEgU
	6yvQLF4LJ93D5RWsVnBEsY0emb/4aGSGTDGLBJxbRvNtxW1fVXvEX+bq/kJKLsE1/r28CnfVMVl
	Mqzvoyzv5wjJWLJLoWg2Igo0LJwB9lxaUcyL4dYlaM8zLRmfecWerYx70KgdU6PILhTIrXoWW3D
	EJpCY3wY59isBaWJyvi9PXV1XHjg==
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id 5b1f17b1804b1-4904717984dmr451274615e9.14.1779973987004;
        Thu, 28 May 2026 06:13:07 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909264fbf2sm41240615e9.5.2026.05.28.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:13:06 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 28 May 2026 15:13:04 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv6 bpf-next 04/29] bpf: Use mutex lock pool for bpf
 trampolines
Message-ID: <ahg_YFpqlTGYQUay@krava>
References: <20260527113951.46265-5-jolsa@kernel.org>
 <20260527122143.CE5ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527122143.CE5ED1F000E9@smtp.kernel.org>

On Wed, May 27, 2026 at 12:21:43PM +0000, sashiko-bot@kernel.org wrote:

SNIP

> > +static struct mutex *select_trampoline_lock(struct bpf_trampoline *tr)
> > +{
> > +	return &trampoline_locks[hash_64((u64)(uintptr_t) tr, TRAMPOLINE_LOCKS_BITS)].mutex;
> > +}
> 
> [Severity: Low]
> This isn't a bug, but could we use the dedicated hash_ptr() macro from
> linux/hash.h here instead of casting the pointer to u64?

ok

> 
> [ ... ]
> 
> >  	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
> >  		/* This is called inside register_ftrace_direct_multi(), so
> > -		 * tr->mutex is already locked.
> > +		 * trampoline's mutex is already locked.
> >  		 */
> 
> [Severity: Low]
> This isn't a bug, but since this multi-line comment is being modified,
> should the opening /* be placed on its own line to match the modern
> BPF subsystem comment style?

we have comments like that in this function and plenty all over the
file, I'll keep it


> 
> [ ... ]
> 
> >  	 * In both cases, direct_mutex is already locked. Use
> > -	 * mutex_trylock(&tr->mutex) to avoid deadlock in race condition
> > -	 * (something else is making changes to this same trampoline).
> > +	 * mutex_trylock(select_trampoline_lock(tr)) to avoid deadlock in race condition
> > +	 * (something else holds the same pool lock).
> >  	 */
> > -	if (!mutex_trylock(&tr->mutex)) {
> > -		/* sleep 1 ms to make sure whatever holding tr->mutex makes
> > -		 * some progress.
> > +	if (!mutex_trylock(select_trampoline_lock(tr))) {
> 
> [Severity: High]
> Could this shared lock pool cause unrelated probe registrations to spuriously
> fail with -EAGAIN?
> 
> If a tracing tool registers an ftrace function with FTRACE_OPS_FL_IPMODIFY,
> ftrace calls the trampoline's ops_func callback.
> 
> If another unrelated BPF trampoline is concurrently being modified and
> happens to hash to the same bucket in trampoline_locks, this mutex_trylock
> will fail.
> 
> Since upstream callers do not retry on -EAGAIN, will this false sharing
> lead to unpredictable probe attachment failures under load?

I addressed that in cover letter:

- after discussing with Song, it was determined that cleaning up FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER
  is not strictly necessary — keeping the trampoline in the ipmodify_enabled state is acceptable.
  The race condition this introduces remains unlikely, so the concern raised in [1] will not be
  addressed at this time.
  [1] https://lore.kernel.org/bpf/aec7bAbGlnEo3R1g@krava/


jirka

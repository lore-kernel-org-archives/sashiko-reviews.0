Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66004FD279
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914213; cv=none; b=YKeIMelpHBsY4pZUkfU5tb9e9vOnnfkFT0gzTbaf2423TlqA0hu62rq6SaKglrESoNOnu1QYZN/vsvDjOHxvTOif3ls8yj+a772Hx2YnbGGEUf+yxy/KyRUB8N3jsh38X1+XrzxcNrwQdeZ5+nJU6qwDAWr1XsjGIrr/yc3qYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914213; c=relaxed/simple;
	bh=9+xzVzStH5jySgGJiobWKMn8FjA+vNjP/UnkeGKkeQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba8f6ihdKhS96u3VIwyFo1gxKAalENcZoWqkK5mAenuJoh7+eVqQrHHN/A+4cdEoM4Kv667qKUXvHZP5sZhuNeX910ScgOiTaYxLM7ksrog+OWGvh+p2rrekbyfVZQVB/liGkDfBfwUuCmeGtTJhSCt7CkizQIDYqvcvGe8IZX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtqyLYRs; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtqyLYRs"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0a28a720aso19899597b3.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914211; x=1792519011; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3urwFIjeTZMI3nHLcO9T0M+7OUsQOTZbc1ClGXMTLY=;
        b=qtqyLYRsRluUSKUexcoKruqRwH2YVtieQ7qKG4RtAg6NQzh1g2zPJL/dh5+hj8nRpm
         Xn6NkhK7KAtUn5itbEUS6Z13eZKQXltEMV187u1zQ/ZEBRH2SL2nTu+iDDouOZ+JVECY
         37ybz22cbpOv2jlqUIsbbjowYaIxKAjtrAkxa8DKyk5aLHchY6PKBCfvmEP+h3+qJUzJ
         08+AYXA4kLR2hZpq302xJ9odG8xmF+oqf6mvYDcDyq2stkiLh1Q6OS1Dex1yQ83JiDTU
         P1vk5FQH205klffsYQc7UHL7OTygq0toSxhYO0hG7XDtchpkrhUtVWbxmUSSfTd/REOX
         KRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914211; x=1792519011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I3urwFIjeTZMI3nHLcO9T0M+7OUsQOTZbc1ClGXMTLY=;
        b=NKuBs/nW29OQ+Re1lAFNxqCb0DJh7Vp4Oeou9y3VVxSjkJGGbdVFjKVwLFbldmogxz
         oh9HvEdZBxkxcfF7xT8HATF2x4EghFM9EsboTU9gYlhZJUOhkgKkmyKJ9kbnWcSsHNsP
         l+TPmZX+KvZKf8PFCm+pcb2hvx8z39CW9OOqIk10BpEEzybXf7cfose0pvVybV2ViN0Z
         HoyeVjdNzgBjTlejibY3md52pMl9pxwAQwjBp9/wN8Yrri0k5GMlWdqeaeA4g/tkOG+f
         bFe8aRsmN/F8Co/qmwfDXZjay9MDN2E84zdv4NDLQkNSaJvgqHPispDuW+d7P8gMlIg1
         KRWw==
X-Gm-Message-State: AFq9FYK5t29PMGC133L0RLMHdV3FvZTAoAqGWnAnfRZh0Pbw60Z8Jdp5
	NvFdcKQz4ztRxQhVJPPthAaCRVa7u73mvsIZ/t+VuCmU7D14wMAcLFjFfQ6U3g==
X-Gm-Gg: AYBFou1SRKrGnzKDY0OZ488vLz17iZqFi3AwctaHh2aGT4rpe2H5SYYYRDP9PKRNKeD
	Sy2E/6lzzcdqHN0SWOLfmfm5/0bTuq3Krb6atWUstESSm+Izb+tuuaHPGPfgUO6ooG6KvMig2Tv
	cuILZlefXXq36Iry9WPHi78akDn8k9PEo4xTaW8AT/c9lEm3qEjcSEAxz1zEg0KlQyzfo48Sl/e
	G4GiASPOeoH8PiKs+n5tX7nvkKFWBOba3WmxhIR6GEmGOa6u4+EfzXTdvmJFolAFCTbdXVC6OwW
	PyUjHf2tsOuNbynBnZyqZn7yAnUy/E2rMyjPInkYSJ110ubvIVPhOb4wA/HecS5RYeR2Yzdhd0X
	nqoOFwhhFol6RvcmCQrbEW2FN1R6RUPPFyMCraDRuQVDbbwCTi8AqIm4Z64W6XUC2tvTOXUippo
	WqXosZBvh+vazIiGSqSXSdUSGztavPprLAAhAoI7u51nJW7WKuQli9yaorqx7mdA49RCwP5Ao=
X-Received: by 2002:a05:690c:c505:b0:8b0:a957:80c4 with SMTP id 00721157ae682-8b0a95786f5mr22590897b3.45.1791914210764;
        Tue, 13 Oct 2026 10:56:50 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d326:f863:5ae3:683])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f2508e0sm48386227b3.38.2026.10.13.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:56:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:56:49 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 08/11] namei: add an rcu-walk mode to the
 ancestor walk
Message-ID: <as5v6B-8O2QQw3zC@zenbox>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
 <20261013164800.2906577-9-utilityemal77@gmail.com>
 <sashiko-outbox-170183@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170183@kernel.org>

On Tue, Oct 13, 2026 at 05:01:26PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] vfs: TOCTOU race in vfs_walk_handover() sequence validation
> --
> 
> commit 1f35bee40e8028ac4b024dd5a54b6bbdbb5b8521
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> namei: add an rcu-walk mode to the ancestor walk
> 
> This commit introduces an rcu-walk mode for the stepwise ancestor walk.
> It adds lockless progression using sequence validation and provides
> vfs_walk_handover() to transition an unreferenced RCU walk into a
> referenced walk.
> 
> > diff --git a/fs/namei.c b/fs/namei.c
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> 
> [ ... ]
> 
> > +bool vfs_walk_handover(struct vfs_ancestor_walk *to,
> > +		       struct vfs_ancestor_walk *from)
> > +{
> > +	struct path pos = from->pos;
> > +	int err;
> > +
> > +	err = __legitimize_mnt(pos.mnt, from->m_seq);
> > +	if (unlikely(err)) {
> > +		if (err < 0)
> > +			mnt_undo_legitimize(real_mount(pos.mnt));
> > +		goto dead;
> > +	}
> > +	if (unlikely(read_seqcount_retry(&pos.dentry->d_seq, from->seq) ||
> > +		     !lockref_get_not_dead(&pos.dentry->d_lockref))) {
> 
> [Severity: High]
> Is there a time-of-check to time-of-use race window here due to the
> validation order?
> 
> Evaluating read_seqcount_retry() before lockref_get_not_dead() seems to leave
> a gap. If a concurrent rename or unlink mutates the dentry and increments the
> seqcount right after the sequence check, the subsequent lockref_get_not_dead()
> might still blindly succeed on the active d_count.
> 
> This would yield a stale and unvalidated path position to the referenced
> walk. Should the lockref acquisition strictly precede sequence validation to
> ensure the sequence hasn't changed during the reference acquisition?
>
This is intended and explained in the cover letter note,
"stuff not changed" bullet one.

Justin
> > +		mnt_undo_legitimize(real_mount(pos.mnt));
> > +		goto dead;
> > +	}
> > +	to->pos = pos;
> > +	to->flags = 0;
> > +	to->pos_flags = from->pos_flags;
> > +	return true;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013164800.2906577-1-utilityemal77@gmail.com?part=8

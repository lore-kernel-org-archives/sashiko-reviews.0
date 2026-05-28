Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521ED3EFD0B
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973835; cv=none; b=S2qCajj1soxX59RcVnFMmsrS094L+F0czxU/USrYaHWaM4gQl+8/Sljq8XmtBb9ufYvAcHo0d8Fcf+2FfQ/ypmOFhiNcwKr6PsDndDERKK2SkFpPJ3XtuS5+Q+joEEetNNX1VM5HJUOuAuAkRIz/Ad7Ks+0NzA/VAq++LMcwRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973835; c=relaxed/simple;
	bh=PLzpJztQbgjm/R5Va8radS8LD2yn/Mx0BQLHJBtdPD8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoiKj+1JK5v5VAqeHNd0iEYzAu1bfx9x8/g3ujE+kSMRFJkBr0F0v1nBxnnlzyHZptydyfNl5o9CB/+IDSYaxkX8KWTs7WS1xEnekIWK8ftVKtYkYtf0FpHqD8z1k3xtEWvf0qm6qJmp7xxYJX+urT8PFG0hq6RdrWUK1KnPcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW8A1xJ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW8A1xJ6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so71903225e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779973833; x=1780578633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHBVfnpng1nZot2BKG6R34xKna8XhFOYG+DQ3zgnWPQ=;
        b=rW8A1xJ62Ru2uQbKZ4mevuq6io/uT4cz29nlO5TEgN1RFylC04A12a3+FY7E0d8O0F
         lxcAhI/R7TL2M3X8IaCjh84ZJLLTzvHbWF/iVZMFpRa/wLgYKz9Z2IvFy3I6StMjTvL1
         2H13wXauahQS3Y/FizWo5nQZiEP/rzRbDAZgpN5yZsaQWQaL3RvSa/OBpjEzQPIqTD/r
         mD8AtulI+HVehkKgxMSSp3KSYo5oQCKIOz+g2XXtN5iXyf81eE+LrFbq1+zWYnLoAB8U
         7XvQTRvfZa0ZVhn+JHSirSF6NaijnopiYrdhmj0xLvR+rZB1lQKyMeuEvq+g7aaJstIn
         9lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973833; x=1780578633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHBVfnpng1nZot2BKG6R34xKna8XhFOYG+DQ3zgnWPQ=;
        b=mCEc2wQ1eCGdDVvpfPr0kgHs62UzIsuSYq4GSXhEkQAuJqUXtFHre+gp3R8ZCb8e+X
         YxNECrA6wFhjaXxMDOy6suvinjCzQa9j+KWiTPH+YkxJP7VYp88TGGm86dUEU6oHXfS3
         OVgsbTDRB5fBwEeLOlkCBfJTZ7TISx1TvW6g956sUa45Y+hQIIS4mqNgkssQt3fVVeyv
         foNs9yvc+FrrKhOligGBBu2PNIXLaSE5H1iiWJ4IEi8NUrwUeJYJUegYHgr6shkTGKeb
         5RYCbUbx+kG0Mx1hOQOz1U2Khihxz5D4tOH4cPOzNJ4mghcSsbF0h1eUM1mm+kwHu5fh
         9yqA==
X-Gm-Message-State: AOJu0Yx+FEAlp1k46Wv47tXNC+sQ5GnyREXO9QQ4BA98EwRJEr++JWyr
	tRSzpiSgD8zzp1OLPH66mTkZ827A707oE6q8cqa2GSVTDqVEshx3K8W/OyL3Uw==
X-Gm-Gg: Acq92OGJiNi/lsThdcoHp7Mlqjuehzg/bCGhB3yudIWl8sRVi+78HIXxTI7DQi9fy9c
	p1qsoQhPpLAmzK8tz/asIp7hYmfKYAjvMgIE0gAtyOsbDhg806PQKHjTP47FvosZ1Rmn1+olHma
	lQLq7v79WCEv8zHH9+G1UPix9BYDYAAEI2wdVXIgdHJJCgHd7Vg59i9Qg1WNzcPT+x4t0aAJFsQ
	hy4yJA+k2s+T3l48Kxr3SGrxVfmVN8WfUxV1b1GSu6cdV/ryjb9lRfasJgax0+wYZghTH7X3XtV
	dGv86z5aom47VU4vwo0aAJpo45SlhrCJlVyKSNE9nXyQ3jmEUGwL8mCtpcPqLTKQM6Nvz5Fq/oP
	yd5VFCeRWPE8FWVrfK9iEloA5HNLiujkK8Nzg8FqvHmibm1U8rBmW/ds1kko2m0widcwjoAq5Qt
	bfPTnzAkCU/RYyaWVOnVj9phqjvQ==
X-Received: by 2002:a05:600c:5488:b0:490:47e0:e13f with SMTP id 5b1f17b1804b1-49047e0e21bmr455250105e9.3.1779973832567;
        Thu, 28 May 2026 06:10:32 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49091d57c0dsm64407835e9.0.2026.05.28.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:10:32 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 28 May 2026 15:10:30 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv6 bpf-next 01/29] ftrace: Add ftrace_hash_count function
Message-ID: <ahg-xtJiSHckH1LP@krava>
References: <20260527113951.46265-2-jolsa@kernel.org>
 <20260527115758.24F361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527115758.24F361F000E9@smtp.kernel.org>

On Wed, May 27, 2026 at 11:57:57AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing a fallback stub for `ftrace_hash_count` when `CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS` is disabled.
> --
> 
> commit 78dc69c9f694d0e9d50e5ac39e06f35ffd293fdf
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> ftrace: Add ftrace_hash_count function
> 
> This commit adds an external ftrace_hash_count() function to allow retrieving
> the hash count outside of the ftrace object.
> 
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 28b30c6f10314..282da661f1313 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -551,6 +551,8 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
> >  
> >  void ftrace_stub_direct_tramp(void);
> >  
> > +unsigned long ftrace_hash_count(struct ftrace_hash *hash);
> > +
> >  #else
> 
> [Severity: Low]
> Is a fallback stub for ftrace_hash_count() needed here when
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is disabled?
> 
> Other direct call functions in this header provide static inline fallbacks
> in the #else block. Since struct ftrace_hash is gated by the broader
> CONFIG_DYNAMIC_FTRACE config, if an external built-in caller uses this
> function on a kernel configured without direct calls, could this cause a
> build failure due to an implicit declaration?

yep, will add the stub

jirka

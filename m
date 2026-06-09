Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC4263F44
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011393; cv=none; b=Z+JLcIblKCdeMJFSrFuSf2L4A7TzQpRsDqgyQJ93rjihrEbcEnAQFDv7qLW+UMYk6JV7sZBkuy1itYVNyt1Rtnh4RhCpDgO9OcEqBohni0/XCOGXMIHgwqiQ5XVoye7am1KaXabNzx0xI0ZE6O3ypPSxNeJNIYVHX3gh0NXN+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011393; c=relaxed/simple;
	bh=aBhiQJaYmOwVyxz82eYRazavqn1zkyHxz3lTj0dRthQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blPjO9LnfRMhxAM0va+08PxhzYuVrP6XrEPLW63fzRefs8+OTnCwX5IWbfKD2HPn76arqGQj+7HH1pnm/YVtT9X00CB2N/ZJ5eRi4Nq+nqEXa4f/XDd06m8pwxP4mKNmxmYokdNhZOoQ9lDlML+oT2/Up3iVUiA/MwnldjPo0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efqBpWMW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efqBpWMW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac357c55so60565335e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781011390; x=1781616190; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ZV6RsZExqbpNR2Ks/4acYQkYZtNf2DRP83lBEHNlGM=;
        b=efqBpWMW0P+of93C2+w0b6LkN63nqqoUfZ/f2/i7XJO94Yd7gM8JXWTVSUglVlom52
         jN+cDono8ir5A+2T9Tnx6VKEh/sjtHx0UEdckj5Tb9SwYH+nGa+arjisVW+3d6r4DVid
         UexsTC99XhtB71Q6xddSnk2xHcg1BkWQyF4V2oKbCt6cwfMzzfPPZaFrDnjI4DCiuPAa
         FXgpnU/K7Ty+swuay3enHes1S2rsoDZFDQ4Us9UJ66a42lFLgVj8sBHy3BHrcSyPYogW
         gE+CSAnE2TgkMX0C7waUHXX+4k4whcreR3hzZwbNHy/GS3Y/kjCdhn8a8DgVyzjhqmCS
         54rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011390; x=1781616190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZV6RsZExqbpNR2Ks/4acYQkYZtNf2DRP83lBEHNlGM=;
        b=UYkuuoDanAI3YEocrh3F2+rYQEsSZikN37ymkEGet8H7Z48Vsk0G5VRpDOytLfOOuy
         MNwlSD0b2wFWXtkxlVjrmUSOcKh5cTW/yeeaugR2IT9OAqBVLSvwVHvsbmg506czXsn8
         0MpShC4qejz/jiy8cT6oJ4olO2gd0hPvvjDp/vZfvi4tJUpDBspNMWSKPcuZ3JzyOTBB
         yDRGZiKdAXsEPKDZ5oNcAZUkwl6L3jNWNMdyIBY4QrgveW2v4ATVFrB0uPwi6tf31rZR
         10hwzvxRNlgnfiMeeMcbXVN4hEuP/2E39tNvxLbpaNzIouMG324Fj0WYwbPYpJfFDXBj
         0+AQ==
X-Gm-Message-State: AOJu0YwPGnChktPc97wf39/WtEyBtTUXmn/FQ2U8PMhkzpCSf30a+gHb
	S3ipR85J9B/crtAzKUv/4LHLHWExgY4rhhuzZBgsISr9Cb+XUaMeydi4pUI4PQ==
X-Gm-Gg: Acq92OHR60kUbc7LdSRg7SriHqf89771z4T5I2VTms+ScPj8XoShsQjbOSI3QT5o0Fg
	Lba2tXw7Aj8aXIy5w3QQKUitlXikbOZnogEf0Uy8U5Y9ZT2qVV8oJ4L5/bWcybHn7mLViNcYnP4
	F1tl9vZATyz3veCCrPofwFEW8GysUOyjdQ/6mxz60FbQH1APZ6JFyGRYc5nVY6ZXCZTQOib+g+G
	kQ0woXmK3zp9tasC4efjQ6ihAT4CYZvlHxAVTN7SYiNCPS7/XthaZ2hMEHu/Qo7zLrhbq130nqC
	mdKESJbFuG0PvErtcavD3JezyO2mIreQcsaMx9O4N2Y/tDDAoXj1iEZKjA1fdtQginixSgeSyTi
	8ARmeK9CnrI9N5uYJL1idKfqZLigpjgt+ffKpu71aMsOg27Yc72QFhxTNunxJO9IsPMOIkxSQII
	sNr0HFrUpH673JyUgCRy8JTQ5PX+EUiXwFY2pR
X-Received: by 2002:a05:600c:608e:b0:490:b355:9c8c with SMTP id 5b1f17b1804b1-490c25f3f00mr306947365e9.23.1781011390145;
        Tue, 09 Jun 2026 06:23:10 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57972104f8f.8.2026.06.09.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:23:09 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 9 Jun 2026 15:23:07 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/6] bpf: Add support to specify uprobe_multi
 target via file descriptor
Message-ID: <aigTuxypMn07LnIz@krava>
References: <20260609104244.588321-3-jolsa@kernel.org>
 <20260609105723.311541F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609105723.311541F00898@smtp.kernel.org>

On Tue, Jun 09, 2026 at 10:57:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing strict zero-validation for the unused `path_fd` field when the `BPF_F_UPROBE_MULTI_PATH_FD` flag is not set.
> - [Low] Mixing scope-based cleanup (`CLASS()`) with `goto`-based error handling in `bpf_uprobe_multi_link_attach`.
> --
> 
> commit f7958ff1ce57c1ab456d3f134881a0081a58b8ed
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Add support to specify uprobe_multi target via file descriptor
> 
> This commit adds the BPF_F_UPROBE_MULTI_PATH_FD flag to allow uprobe_multi
> links to specify the target binary using an already opened file descriptor
> instead of a path string.
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index 970ce7bbf99e1..4965006d58ee6 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> [ ... ]
> > @@ -3240,29 +3241,51 @@ int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *pr
> [ ... ]
> >  	uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
> >  	ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);
> > +	upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
> >  
> > -	err = user_path_at(AT_FDCWD, upath, LOOKUP_FOLLOW, &path);
> > -	if (err)
> > -		return err;
> > +	if (flags & BPF_F_UPROBE_MULTI_PATH_FD) {
> > +		/*
> > +		 * When BPF_F_UPROBE_MULTI_PATH_FD is set, the executable is identified
> > +		 * by path_fd, and upath must be NULL.
> > +		 */
> > +		if (upath)
> > +			return -EINVAL;
> > +
> > +		CLASS(fd, f)(attr->link_create.uprobe_multi.path_fd);
> 
> [Severity: Low]
> Does this code violate the cleanup subsystem guidelines by mixing scope-based
> cleanup with goto-based error handling?
> 
> The bpf_uprobe_multi_link_attach() function relies heavily on goto labels
> for error paths (e.g., error_path_put, error_free, error_unregister). The
> kernel guidelines state that goto-based cleanup and scope-based cleanup
> helpers (like CLASS) should never be mixed in the same function.
> 
> Should this function be fully converted to scope-based cleanup, or should it
> use explicit fdget()/fdput() without CLASS() instead?

ah true, I'll unwind the fd retrieval or perhaps move the path retrival
into separate function, will check

> > +		if (fd_empty(f))
> > +			return -EBADF;
> > +		path = fd_file(f)->f_path;
> > +		path_get(&path);
> > +	} else {
> > +		/*
> > +		 * When BPF_F_UPROBE_MULTI_PATH_FD is not set, the path is resolved
> > +		 * relative to the cwd (AT_FDCWD) or absolute  using the upath string.
> > +		 */
> > +		if (!upath)
> > +			return -EINVAL;
> 
> [Severity: Medium]
> Should there be strict zero-validation for the unused path_fd field here?
> 
> When the BPF_F_UPROBE_MULTI_PATH_FD flag is not set, this branch is taken
> and attr->link_create.uprobe_multi.path_fd is ignored without being
> validated as zero.
> 
> If userspace passes uninitialized garbage in this field, it won't be
> rejected. Could this break forward compatibility if path_fd needs to be
> assigned a new meaning in the future?

right, I'll add the path_fd check in here

jirka

> 
> > +
> > +		err = user_path_at(AT_FDCWD, upath, LOOKUP_FOLLOW, &path);
> > +		if (err)
> > +			return err;
> > +	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609104244.588321-1-jolsa@kernel.org?part=2

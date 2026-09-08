Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF854B1A0
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874351; cv=none; b=iTJPcEd/b+rju6IGIEVLJamp+SYHtUeSBPwCUkdoYiKI7wOC06w3nrngAEa30oDBGxNvx/xHO4+zltkUhtC/zfIJB+HVGDtp6ICs3k9G1Ix/nfti+xPBKAVQ1yMlb7E3uzTTKdgnyS9JebWAsyyIWw4zl4s1K+l5pM5fQdqlOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874351; c=relaxed/simple;
	bh=WkJJWZ4SaxJF/zyHzYEhTuM+Mb9yokH8po4OGhCk8uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMupEajvtVttBF/HdyET3stgo8sxLRCT/AISuh2Xgl30tJjJqlHXFcs1ZAUzggy2Z7tVLHqHl1DhXuuanYlEojTCdV21wDJbH0bFdy0RtFHxzr10i5NxKP9VzfMgCpQA5TZNLkp/Cu22GuanEMboErY5ogJUaGF1Lfp9wGJBIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gRwaKnzg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gRwaKnzg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so66061415e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788874334; x=1789479134; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzA37jUw1zDr0CBMAEx16zABWeBDZswZOBHILRhm0ZI=;
        b=gRwaKnzgRZTbRPltXBz69xwH8gvUkPzp8wztp5O0OnOTq6Yz6hHQb+f3KDxscJRhT8
         MVfyt5vjLoyc0gxX9fsb7Dj3P+h/FzNAQ/7YZvWHu+7Vah6FcBzH3CigY8r6zmuSVnoI
         EvSXaDT2GJ0cGKMBTl1SeV80x8MlRzA5ndlN3YWZ7NIHCMWljQd0IZqkE1uLF8rLdxKp
         SZg/aPrdn8zPw+nRvHP7DDHxauCdqRdKyDy4VHmqObIL9MYVnwKGYog34XOO+exUEQIt
         zbLpsM2UF63graZeapR0pk23ky/z6I1srhp+Q2Va4yHVU2twiKTVaYNhSVSDtR48bIqO
         4Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874334; x=1789479134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzA37jUw1zDr0CBMAEx16zABWeBDZswZOBHILRhm0ZI=;
        b=rwNbn7hJ5ZWqpTb3pn8Au7U1RQAOC4xalxmK9CjiYkpM3jpjv91R+lHsF62kK7y5qA
         KO9vXQmO24/J3bwVseva3bE4hk26lrrsJqf2r4SXLS7Xzjj5VhAnRgVCmqWySKhNLdgt
         YqAZ2OFPSnLefahNRdZvZCQlcM5W/nMJKxL1fTyIOrK0awHkcaFpzLRCA4E2dHY90Qy/
         pdrr7Ni0VWab1G3cF3vNf8sDIrVmmbrIDX4Mdyw7wwuo146uXUshO9i5tmtRJzYgsBlr
         5IyFPIAtX1D0/4Fzv0qBgwIJbbQKX8+Or6yKxlDGtpisn7UWOoiiL0JT1hlan79Lnclw
         soyQ==
X-Gm-Message-State: AFuF++k2HiYBLjUoPdEirIAj6YC/CzSj0XRcVoEdrn/K4b9qdmXXdRE1
	t2y8rDBXimeO7dHQBf7CXDVEdSh7jQqr913rGNMkxumybuPW1mcgAvQstFVSrbyKoYtpOzc5ytg
	goqOYgtg=
X-Gm-Gg: AYBFou0V7G5IpBG6v7WBl/vW/h1JHqah1Rjwxl0/H3PyKcaUD/Uy6jdFXUKQzGRv1gK
	wYDKvRTRldiocs3z3LI0mckEEN17PyZaOcl6istQLbGtDNa0HsFAZQi7Axg2MtDLO3TnGVP00S2
	DRB/Us0HLJRtIP18wGqYhkNfHc4lJucTy/qrmiWRLlrlclLsyHDXWmV4KbxAsZo2VkBhKlkxIbN
	ub3s+ZTW0dwDRbihnJtb6HGudZPsjKOIClWrHn5XE74HNSjrQfZRJMNc4Ygz+oQt7UqdwlqVfQE
	V6Xt/xY5gMd/sw9w64WJwYF6iYxgZZD9z2f56b/1o3WkS53v7qbYD3wx9z12g08/dudNwax6ofW
	8KFw0zWuqfsX7S4PXqxwwNeWYqq5KK5lIFHTJZA81r3FW6npWkoNSsAwq2QQMWkDIbNnxkgkrEr
	83YSSoiuAbJ9IHVaexr1aDcUdrAcm6DlXv5CSmcjxdZvuRCjhzv/s=
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr409557115e9.5.1788874333600;
        Tue, 08 Sep 2026 06:32:13 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm518069085e9.14.2026.09.08.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:13 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:32:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, joe.lawrence@redhat.com,
	Harry Hsu <x90613@gmail.com>, mbenes@suse.cz,
	linux-kernel@vger.kernel.org, shuah@kernel.org,
	live-patching@vger.kernel.org, song@kernel.org, jikos@kernel.org
Subject: Re: [PATCH v4 5/5] livepatch: Clean up klp_init_object_loaded() when
 fails
Message-ID: <aqAOWrmq1YgTbgAi@pathway>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-6-pmladek@suse.com>
 <20260908122549.193F41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908122549.193F41F00A3A@smtp.kernel.org>

On Tue 2026-09-08 12:25:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Partial relocations are not reverted when apply_relocate_add() fails midway, leading to permanent state corruption.
> --
> 
> commit 3f6df1b4ed699e839abbdc8919a6c7de5d1850c8
> Author: Petr Mladek <pmladek@suse.com>
> 
> livepatch: Clean up klp_init_object_loaded() when fails
> 
> When loading a module, klp_module_coming() updates all enabled patches.
> If an error occurs, klp_cleanup_module_patches_limited() cleans up fully
> processed patches, but skips the patch that failed midway. This commit
> updates klp_free_object_loaded() to revert all and only changes made by
> klp_init_object_loaded().
> 
> Closes: https://lore.kernel.org/r/20260823062313.1321B1F000E9@smtp.kernel.org
> Closes: https://lore.kernel.org/r/20260830175608.4BABB1F000E9@smtp.kernel.org
> 
> > Next, klp_init_object_loaded() has to clear its own changes on
> > failure. It just returns an error when relocations failed because
> > they clear their own mess. It could call klp_free_object_loaded()
> > in other situations because all relocations were done and other
> > values are just cleared.
> 
> [Severity: High]
> Does this actually clear its own mess completely? Looking at how relocations
> are rolled back in klp_write_object_relocs_limited(), which was introduced
> earlier in this series:
> 
> kernel/livepatch/core.c:klp_write_object_relocs_limited() {
>     ...
> 		ret = klp_write_section_relocs(patch->mod, info->sechdrs,
> 					       info->secstrings,
> 					       patch->mod->core_kallsyms.strtab,
> 					       info->symndx, i, obj->name, apply);
> 		if (ret) {
> 			if (apply)
> 				klp_write_object_relocs_limited(patch, obj, false, i);
> 			return ret;
> 		}
>     ...
> }
> 
> By passing i as the limit to the rollback function, the rollback loop:
> 
> 	for (i = 1; i < limit; i++) {
> 
> will terminate at i - 1. Doesn't this skip the rollback for the partially
> applied section i?
> 
> If apply_relocate_add succeeds on relocations 0 to k-1 in section i, but
> fails on relocation k, these partial relocations remain permanently applied
> in the livepatch module's text. 

This is the same problem which was reported for the 4th patch.
It would need to handled in the arch-code, namely
in __write_relocate_add() in arch/x86/kernel/module.c.

Best Regards,
Petr

> Subsequent attempts to load the target module will fail immediately at
> relocation 0 due to non-zero target memory, converting a potentially transient
> address-space layout failure into a permanent -ENOEXEC on retry.

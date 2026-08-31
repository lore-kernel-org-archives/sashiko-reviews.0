Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6240BCBD
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181031; cv=none; b=Kmtcq099nw0sXbq23lETn4t2OK6jANn2k9FhdkYhp5cz6CNg+MDoYxPRVi66FyHm1UK4o/92RCK7imYMVCbbvC1bp3sXqCyruYqvBzhsThweFjS/dAy1WuxtejhOub03FJrfB6+a5ao13foaMGEgO4qsg4gYx+5tqUevnFBO70k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181031; c=relaxed/simple;
	bh=8Osa2PuSG7NB9dJZI5amIi1Tsefo0mCPT5lN1eFX25U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOZSnozlrL/rydDgulhXLH1ne3UrpwVjoctcRHF3j9iXPrcCumHOCncwUCkEwbtr3sTRJgp4JxxFw4VxLsF6aVwg193aYuMYVon1mXxKB20JHSC6Az41yYRgpyWnGIJ/qTbPUkPTxXZpW2nwYFnBIfiFRxwDwQ94vdUzVq1L9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JGGjQIIS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JGGjQIIS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1277222f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788181027; x=1788785827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZQJDQy5rb/uJP6b6BKCnJ/LPglbNUPImqzRgdlzJPKA=;
        b=JGGjQIIS9vqItY5XbclOZd+BqCrI/Jk3m6dWyn/MAfxCrCuMk2yNLzxd7OFGgQpZ4v
         JndIOyodsvpTm6tVmteSnKMyybW2ii+JoDu1Cuhcxi+I8lTvIuRgwXMuc4tUwWJ3aP0Z
         J332jxTMGywOxBf4LYkb6kYVvZ9fkSV0GssJF8dla3zsWJ6QVUg6k0XozKetYk9GfEPx
         ZrCm/KbmD9xftRJLyuhAiztoeI89lriyIWD/QSyvsEJlw1aUTdrqkBvmBYaitSHhGy8S
         trhuVjXkjxttY/JJlNvhzxrHoiwLS4MCf0zr2sfU3SoKoyKZ1boxdiLCAcVLxnuezgsU
         Kxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181027; x=1788785827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQJDQy5rb/uJP6b6BKCnJ/LPglbNUPImqzRgdlzJPKA=;
        b=o8GrSYPJk4DATMqkDOAnlERYCMky6M693oev2dZVfnFRmFoTmbAsao/ZNGs7SZO9QD
         U0kIrvh3tLHRZZW489LWsrXInBrVEsfjogRrXYuMC8N6rYphWWPitLX4a90XN9ic7ry8
         wEXjxf0Kki/5o8BNKX4el340Z1v+KQWtdzi5anmg7/VQeTBW9wrlvGSNOxNDXYc6TTLn
         RkWJ3YyHqMDbnB5ZLp6EA+RizISOK6/S6BkuGN0xDIhbDjOU71qvJk5p9o3L5xP46EV8
         +jC4VgWZ2LE28sdZKWRhxWw+/0ELEJcgnTN9ej6Ee9mJItSZbsAdhKVIFeP4YcJorC+o
         UH+w==
X-Gm-Message-State: AFuF++md5cGwNUZWfBN/f73zQpf53+4wGE3kuaBNZf/bHTMAikP9m+A0
	S8GRxRlWVWjfM2p08BzGB3nEaNeQDfXjQgRLTj/9NyUen6cXvxcS1Uzzy5P7HtaVrynB5ZNhGHB
	RuGv5cuw=
X-Gm-Gg: AR+sD11uiK14Nbqt95crbEvdIrlUpBYg6ZTVV96ioahpULsDT2UZHKjxeA8i5vFnhft
	RQ//CgWA5muXcIvdJu3JDf7xPcxC1krPd5XF9cfBs5kgoE/gDCgfuBtU4st4rup6wqLrvhiow/G
	ngYJoO/7etayehvCOpozPT3Fx4Hsjmeaput+OB2pNaKiFF8+eOqPxTJi/tCgBwd33eLsPm//RvY
	EfV1d4fxcMTI3JJXToGNIYT36t9IDcjDKIhhj3SON4X4qDVz4+Pb2CJ1lr3EHyyopIrIvhdsc+3
	ssys6TuqPHN3il3ylPVQAbGhe7lQUc9BDUpVyxkSGpiMEbz5CKPc27FS5Mrz7cDYRXbm9HH2edG
	ooewx7x7VJxHBO9grITwbRrMkigxBu0de8Td8ymPsSoBUtviTiu2gIa++TTGUeghy88RlPizWnT
	DNWsHUbmuTq0swVbg1l56GYHNRQkq+z+9Z6sRJlLdn6G+EaY0c5Kgea/OAgRcOkw==
X-Received: by 2002:a05:600c:8b88:b0:49b:4d64:bbc4 with SMTP id 5b1f17b1804b1-49cdc4403e4mr7292785e9.8.1788181027219;
        Mon, 31 Aug 2026 05:57:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdb13f094sm31431385e9.3.2026.08.31.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:57:06 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:57:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Harry Hsu <x90613@gmail.com>, jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org, jikos@kernel.org,
	joe.lawrence@redhat.com, live-patching@vger.kernel.org,
	mbenes@suse.cz
Subject: Re: [PATCH 3/3] livepatch: Clean up klp_init_object_loaded() when
 fails
Message-ID: <apV6IPGhqhK7cGeh@pathway.suse.cz>
References: <20260830173343.52759-1-x90613@gmail.com>
 <20260830173343.52759-4-x90613@gmail.com>
 <20260830175608.4BABB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830175608.4BABB1F000E9@smtp.kernel.org>

On Sun 2026-08-30 17:56:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Failing `klp_apply_object_relocs()` triggers spurious architectural warnings due to unconditional clearing of unapplied relocations in the newly added error path.
> 
> Pre-existing issues:
> - [High] If `klp_pre_patch_callback()` or `klp_patch_object()` fails during `klp_module_coming()`, the successfully initialized state from `klp_init_object_loaded()` is leaked. The cleanup function `klp_cleanup_module_patches_limited()` intentionally skips the currently failing patch, leaving applied relocations in the livepatch module uncleared and causing subsequent load attempts of the target module to persistently fail.
> --
> 
> commit a90c142b7a6f2c5551f83382ec1fcf15614ffbac
> Author: Petr Mladek <pmladek@suse.com>
> 
> livepatch: Clean up klp_init_object_loaded() when fails
> 
> When a module is loaded, klp_module_coming() iterates over patches and
> calls klp_init_object_loaded(). If initialization fails, it delegates
> cleanup to klp_cleanup_module_patches_limited(). This commit updates
> klp_free_object_loaded() to revert all and only changes made by
> klp_init_object_loaded().
> 
> Closes: https://lore.kernel.org/r/20260823062313.1321B1F000E9@smtp.kernel.org
> 
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index a6796cd6b65fd..706a4a7193514 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> 
> [ ... ]
> 
> > @@ -916,11 +920,17 @@ static int klp_init_object_loaded(struct klp_patch *patch,
> >  		if (!ret) {
> >  			pr_err("kallsyms size lookup failed for '%s' replacement\n",
> >  			       func->old_name);
> > -			return -ENOENT;
> > +			ret = -ENOENT;
> > +			goto err;
> >  		}
> >  	}
> >  
> >  	return 0;
> > +
> > +err:
> > +	klp_free_object_loaded(patch, obj);
> > +
> > +	return ret;
> >  }
> 
> [Severity: Medium]
> Does this unconditionally clear unapplied relocations?

Ah, I thought that this should be OK.

> When klp_init_object_loaded() fails (for example, if a symbol lookup fails
> after klp_apply_object_relocs() succeeds, or if klp_apply_object_relocs()
> itself fails), this newly added error path calls klp_free_object_loaded().
> 
> This unconditionally invokes klp_clear_object_relocs(), which iterates over
> all .klp.rela sections and attempts to un-apply them via
> clear_relocate_add().
> 
> However, for sections that were never applied, the target memory remains
> unmodified (zeroed). On architectures like x86, clear_relocate_add() uses
> memcmp() to verify that the memory contains the expected relocated value.
> Since it does not, it prints an "Invalid relocation target" warning for
> every unapplied relocation entry, resulting in significant spurious warning
> spam in the kernel log.

Sashiko is right. __write_relocate_add() really checks the original
value even when clearing relocation at least on x86_64.

Only klp_write_object_relocs() knows which relocations were updated.
So it has to clear its own mess.

I am going to do the following changes on top of this patch
(just compile tested at the moment):

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 1c217ac49d2b..b6ae3a518ca9 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -342,14 +342,17 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 					secndx, objname, true);
 }
 
-static int klp_write_object_relocs(struct klp_patch *patch,
-				   struct klp_object *obj,
-				   bool apply)
+static int klp_write_object_relocs_limited(struct klp_patch *patch,
+					   struct klp_object *obj,
+					   bool apply, int limit)
 {
 	int i, ret;
 	struct klp_modinfo *info = patch->mod->klp_info;
 
-	for (i = 1; i < info->hdr.e_shnum; i++) {
+	if (!limit || limit > info->hdr.e_shnum)
+		limit = info->hdr.e_shnum;
+
+	for (i = 1; i < limit; i++) {
 		Elf_Shdr *sec = info->sechdrs + i;
 
 		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
@@ -359,13 +362,23 @@ static int klp_write_object_relocs(struct klp_patch *patch,
 					       info->secstrings,
 					       patch->mod->core_kallsyms.strtab,
 					       info->symndx, i, obj->name, apply);
-		if (ret)
+		if (ret) {
+			if (apply)
+				klp_write_object_relocs_limited(patch, obj, false, i);
 			return ret;
+		}
 	}
 
 	return 0;
 }
 
+static int klp_write_object_relocs(struct klp_patch *patch,
+				   struct klp_object *obj,
+				   bool apply)
+{
+	return klp_write_object_relocs_limited(patch, obj, apply, 0);
+}
+
 static int klp_apply_object_relocs(struct klp_patch *patch,
 				   struct klp_object *obj)
 {
@@ -902,7 +915,7 @@ static int klp_init_object_loaded(struct klp_patch *patch,
 		 */
 		ret = klp_apply_object_relocs(patch, obj);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	klp_for_each_func(obj, func) {



> [ ... ]
> 
> > @@ -1274,8 +1284,8 @@ static void klp_cleanup_module_patches_limited(struct module *mod,
> >  			klp_unpatch_object(obj);
> >  
> >  			klp_post_unpatch_callback(obj);
> > -			klp_clear_object_relocs(patch, obj);
> > -			klp_free_object_loaded(obj);
> > +			klp_free_object_loaded(patch, obj);
> > +			obj->mod = NULL;
> >  			break;
> >  		}
> >  	}
> 
> [Severity: High]
> This is a pre-existing issue, but does this cleanup logic leak relocations
> if klp_module_coming() fails after klp_init_object_loaded() succeeds?
> 
> If klp_pre_patch_callback() or klp_patch_object() fails during
> klp_module_coming(), the successfully initialized state from
> klp_init_object_loaded() is leaked.
> 
> The cleanup function intentionally skips the currently failing patch:
> 
> kernel/livepatch/core.c:klp_cleanup_module_patches_limited() {
> 	...
> 	klp_for_each_patch(patch) {
> 		if (patch == limit)
> 			break;
> 	...
> }
> 
> This prevents its newly applied relocations from being cleared. Since these
> relocations modify the livepatch module's memory, they persist even after
> the target module's load attempt is aborted.
> 
> Upon a subsequent attempt to load the target module,
> klp_apply_object_relocs() will attempt to apply the relocations again. On
> architectures like x86, apply_relocate_add() verifies that the target
> memory is zero; finding it non-zero, it returns -ENOEXEC. This causes
> klp_module_coming() to fail, permanently preventing the target module
> from being loaded as long as the livepatch is loaded.

Sigh, I got a bit lost in all the cycles. I believe that this should
get fixed the the following changes on top of this patch:

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 1c217ac49d2b..09b6f4aa6217 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -1360,7 +1373,7 @@ int klp_module_coming(struct module *mod)
 			if (ret) {
 				pr_warn("pre-patch callback failed for object '%s'\n",
 					obj->name);
-				goto err;
+				goto err_free_object;
 			}
 
 			ret = klp_patch_object(obj);
@@ -1368,8 +1381,7 @@ int klp_module_coming(struct module *mod)
 				pr_warn("failed to apply patch '%s' to module '%s' (%d)\n",
 					patch->mod->name, obj->mod->name, ret);
 
-				klp_post_unpatch_callback(obj);
-				goto err;
+				goto err_unpatch_callback;
 			}
 
 			if (patch != klp_transition_patch)
@@ -1383,6 +1395,10 @@ int klp_module_coming(struct module *mod)
 
 	return 0;
 
+err_unpatch_callback:
+	klp_post_unpatch_callback(obj);
+err_free_object:
+	klp_free_object_loaded(patch, obj);
 err:
 	/*
 	 * If a patch is unsuccessfully applied, return


Note: This is called when it fails in the middle of

		klp_for_each_object(patch, obj) {

      Naive approach would be to implement another *_limited
      variant which would revert the action for all already
      proceed "obj" structures.

      But this is called in klp_module_coming() so only one
      struct object should match. All others are skipped.
      This is why it should be enough to revert only the last "obj"
      in the err_* goto targets.

      We propably should enforce this => add another patch
      which would reject livepatches which contain two
      struct object for the same object.

Best Regards,
Petr

PS: I am going to wait few more days for a possible feedback.
    Then I would v4 of this whole patchset with the additional
    changes.

    I hope that the 1st patch from Harry won't need more changes.
    So, I will only fix my part of the patchset. /o\

Best Regards,
Petr

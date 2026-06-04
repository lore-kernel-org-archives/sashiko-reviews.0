Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C49239E9B
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578592; cv=none; b=NkhyiBzBljtr1EN5Hr/EiLjJ3i6bv/Dq1ULNP2Wx2SlBnXCQ2xdBmG2TGV2SrWDZpW+BCrKdDzEse1QTwaUm0crCJLziOje9it7pjWid8PeGGfmXbjgsaYdb50ltebqpAiGHZlvb5lvNeplaZZa/r5dLkgyqKo7PqldrTM7ODQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578592; c=relaxed/simple;
	bh=Sn3lKQIudwwunx7+Nr0y3ITWmEl6iVkiYlEfVNv7FTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebR3kwvmO1KQJuIBOoEFO4znFONjuLkU+vbMmDurG559L1AU1XPA2zbIYxTnsc0jo9hwo29AylIlUJheEXEEi8MEA5efPJhYPLcX/dDqUsoBhxygXqvd0XwTyU3IGNX7JFrf2is5G6TR6o83+3f3yXttmHKPfOL24Y/+ditwlM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GYtkT9dN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GYtkT9dN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4600cbb06deso400332f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780578588; x=1781183388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oY1VKwPkVFKv4NeE5kqwicRyh8+m7qj+rD/u5rkZKI=;
        b=GYtkT9dN1VeMgaESrp8KNHZ+3F2sikk+e5iOAf1XXUAutFL9TBtJHeZ4yZ/qeibx3V
         13IFKjVJsfEFdgi5w8ftjOZtO+cUACW8CUMPMpeJElGnnukqbTANPoHcyTI9M//sqF4Y
         Af56Z6PDHmcLnnYhYC6H4itLb8vrNIxwO/UFzmcWIFTWIRvek4aiQtEBbrYf/g8qumRO
         kcZts7Hsx62zFl9og1ABLam0AX01jUWyNzorckF/QADi5qOapu6JVrN8lhjAhBdLXn7C
         S06kPFtnsEIOcHKTfRhFJLTRsrPk/a8HmdqT+PW3tDiGSulAizPlLrfJIFjfKAzBW3Es
         /qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578588; x=1781183388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oY1VKwPkVFKv4NeE5kqwicRyh8+m7qj+rD/u5rkZKI=;
        b=gK1bIdIOnjGMOXkwIIt2vfXIIKvF+tKP9DiJVtS+4vF6DCNxTFFMzwRA+58KmEmuD/
         aFsN5FeW2miep/w//KroX9PtuS4PnE0TA75tCYGZoVj83DfbnIen31uPRKpiUhvMZR1Q
         5w3m4Z0imlpCaN/1ITkndIgDOupZUPRb0QeQP/69IU9+U0994nbTojsF4HAqZOrZwHzN
         1eHAy0GYC6lkXJ1xpj9UomPN8XC2qHBribRUCKJPOdBIBLUsvgCtuAXUm78zm5a2uP+H
         N1Y2EIc5Qdp168nMv0lkfvxtDHYQr1h8vae8wkgWu3fBgxqkRWfFRpm6B21xPcfxtxeH
         TgJQ==
X-Gm-Message-State: AOJu0YzHUcsLO1JVk1ntYfu1Y7d/9MG3tazPGHtFvjExrevWTuntouwM
	GBDgROhqrcAVpe15h8cFlvR2M28pWdQRRTbx9t7o6kHMVS13DnyhRTyje/I0yW35POYS+3j0ial
	mXj6z
X-Gm-Gg: Acq92OFnd363uHIGe0KJeIe33XwfUjma8UafGcHcXrD9bKRAw7eKOntexPSGOkiJokx
	vr7xovfmZD7SuPHBDxpf2narw6wJ7YMNLsdABNMKT6OiF1yhBAAcaZbcPdhfviHnfpQYa0YDsBj
	0BAdCpCxMtF+KWQYjH46Sima6hTZDUKF+TkGqGICaYlTn8zZVyKmkPKB6s4DL40wY/BShOpa3Bb
	AxAKaeZmiHNheywSnJy7tefg5Nlx0T8+vJnKWCFPcCugTWT/AnbAtKG1vuo5gzS0lEzW8r/jK3u
	wK04eZel5Y24JvJvMvGfLtbB2Ul0XkSBRxlbTwaBGY+zNtBS4zuiWUJpRgvPjQf5yU+azUYMkol
	Kaim/x955t3tPak0nBDRzzJThbpWN7z/gE4QArsIBivoT4Vkf/kPrxxLNAxgksI1BeO3tEaf+GJ
	zvRgvItYJ9iSoFw4Iw03k/46lAtmtib/S8mjYP+0kuFhYmBi0=
X-Received: by 2002:a05:6000:2082:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-4602743465dmr5736255f8f.20.1780578588549;
        Thu, 04 Jun 2026 06:09:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16351006f8f.0.2026.06.04.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:09:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:09:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: mbenes@suse.cz, live-patching@vger.kernel.org, jpoimboe@kernel.org,
	Rui Qi <qirui.001@bytedance.com>, joe.lawrence@redhat.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	jikos@kernel.org, shuah@kernel.org
Subject: Re: [PATCH v2] selftests/livepatch: fix resource leak in
 test_klp_syscall init error path
Message-ID: <aiF5GjePTYmLrpg0@pathway.suse.cz>
References: <20260604083208.1071428-1-qirui.001@bytedance.com>
 <20260604084214.4F9751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604084214.4F9751F00893@smtp.kernel.org>

On Thu 2026-06-04 08:42:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Relying exclusively on kobject_put() to clean up sysfs attributes backed by module memory introduces a use-after-free window during module unload if CONFIG_DEBUG_KOBJECT_RELEASE is enabled.
> --
> 
> commit 89541aa9ecd8e356eaf4884fa2b111bc605a7933
> Author: Rui Qi <qirui.001@bytedance.com>
> 
> selftests/livepatch: fix resource leak in test_klp_syscall init error path
> 
> This commit attempts to fix a resource leak in livepatch_init() by calling
> kobject_put() on the error path if klp_enable_patch() fails.
> 
> > --- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> > +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> [ ... ]
> > @@ -98,7 +98,11 @@ static int livepatch_init(void)
> >  	 */
> >  	npids = npids_pending;
> >  
> > -	return klp_enable_patch(&patch);
> > +	ret = klp_enable_patch(&patch);
> > +	if (ret)
> > +		kobject_put(klp_kobj);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but it replicates a pre-existing
> issue into the error path.
> 
> Does relying exclusively on kobject_put() here create a use-after-free window
> during module unload?

Sigh, I always get lost when looking at kobject-related API.

> If CONFIG_DEBUG_KOBJECT_RELEASE is enabled, kobject_put() drops the refcount
> but schedules kobject_cleanup() (and thus sysfs_remove_dir()) to run
> asynchronously via a workqueue after a 1 to 4 second delay. Because klp_attr
> and its show callback are allocated in the module's memory, returning an error
> here causes the module loader to free that memory immediately.
>
> During this delay, the sysfs file remains fully accessible. If a user reads
> this file, would sysfs_kf_seq_show() dereference the attribute and callback
> that now point to unmapped module memory?

This sounds correct.

> Should kobject_del(klp_kobj) be called prior to kobject_put() to
> synchronously remove the sysfs entries?

I am not sure if this would be a complete solution. I do not see
anywhere that kobject_del() would be synchronous. I think that
the file still might stay opened.

> > +
> > +	return ret;
> >  }
> >  
> >  static void livepatch_exit(void)
> >  {
> >  	kobject_put(klp_kobj);
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but the exact same vulnerability exists here in
> the unmodified module exit path where kobject_put() is the only cleanup
> mechanism before the module unloads.
> 
> Could we also add kobject_del(klp_kobj) before kobject_put() in
> livepatch_exit() to ensure sysfs entries are synchronously removed before
> module memory is freed?

I would ignore this. The same code (just kobject_put()) is used in
samples/kobject/kobject-example.c which is supposed to show how
the API should be used.

It is just a test module. The interface is used only by the selftest.

I believe that this is a problem of the kobject API and should
be fixed there.

Best Regards,
Petr

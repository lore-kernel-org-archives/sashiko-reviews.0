Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2D38B7BC
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626987; cv=none; b=ZH6y2WmN1+kxsNb9zVFT6j8iRC241e8mk/XRiB6GYrp+IKRY63f7UATkIRmYwCnpQJ2QlmFwlt7t1XgNONP0T5RyDrcPqWVejjqz7TLdOl+OsJj3WQtvzPE1v/z7t2MkJT83mk3b8R4SaS5xmGo3qrSBC7jV8woimMexDV2UHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626987; c=relaxed/simple;
	bh=6dt3Ufb5RisjOvIx7jeq08hJ7uBHukeiJU/N0FKxucc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg8YDpie5emSgqsimVraqc4tM2s24QxLrqvGCn/ZoGTF0dfTfLha78gnBBM6KIZ3wvQksGJ0dJd9Ix9tyF0KKfoYH7QGKLIzMI/XEHg4yzlk8/kP9lpnPoS9pML6Fjd20jQgoX1da0OV/dxRIC5IXbqA6few0HoFPfqvZTF7a9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QoDBXjV0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QoDBXjV0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f6609c657so1019326f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786626984; x=1787231784; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0e+2GX5rm60FuEMHuqP+WuIydlySPn3ZKCDLSPuaJHY=;
        b=QoDBXjV01jSv50rhHyXN2NGv8YpEh2Jrmm03HyMfNfksijUxfwTKf84kaikh3bgOIi
         WLJlFgUu9r4TyBt+pt/0Z+07sJzE8pYaPj2k6ad1jFA65X8d5d7tov/PuVUvO2AMlezW
         QpC1TkG9b1tN7S7X1JQhQYLTb2KYbOr7wxPgEJS/WKj0Z+NWzmsG/Z72dpbpsM2VktMM
         F/JtzBu99VSnD1fCRIFeno9thiyz95DljN9QKfRtyceKY/YnGUvC7I5RE2lydc3GU870
         xRtZFfgjJWjImxRXK4VNHQwDhIOfqv0VzuzsEVWLO+vLMWlL9L876xyO6ao2cBrA0LnH
         /Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626984; x=1787231784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0e+2GX5rm60FuEMHuqP+WuIydlySPn3ZKCDLSPuaJHY=;
        b=J7LeKqBxaBQByBGKTtQJw2/0ZGBZN/ca7isozThZ1LFsoyAP4UhYij7Es7IzB5zss7
         vbdl1ZwWRw7M0b1SaBcaxhBHqqIdDA3lfLm6WV1EZId5i/+NRzfXpt1u0Rnqri3pQQ9p
         MvtAl25LSL7+yR/9qivjfOotZKtPTWXzlgH+x8TSIbDMqIm4f6z1gG3DTxCzUZIfGD4A
         8XEYNjUu8ecxQ/3XgooYQHhh0tPk3Bnu25N3Htctpm50sExYMXrWp96VzH4qGhXHH7XS
         aU5EIDeTS9iItb6eFgD6Pl7qFviiM0c+dpIl6Ia/wlDnpmioLffTsoLf8lUo2gTBUcX0
         HiEw==
X-Gm-Message-State: AOJu0YxrLpy9vs22V4JujPmqyF0bZf/0hilyG7FwkC7oSvrkenEZYzZR
	LbbzyL09nfUKKYM1JGvkC3vtzko2gWASqnLjegQNanibbEUNbhtZ1uXzUfYJRFC9B0e7jJE08rY
	1m5quDw==
X-Gm-Gg: AR+sD11bxGZ/xUOK09rjyvE6GfMvJ5goA6xaLd9pNSBeTZwgBI/Rj+nlRLFu+arun0k
	0m333V9wjbdQ7rrPfPjDhhWBmHTjWOOFVia9g5Kpzvg2xDZ2cPAKj9yEOaENdytUfg/PX0aaMai
	zMyLiHaKdiB/o+ji+Qoexq7RPT1Ty5OQy80ZV1OwQNOfzmH/Rqt6BJm8XphkKVMHpeEz1NIQxjV
	OUkAMmI8J39Q+l+8hQJB88+UMjK15h51C/AGqOo4I2cjgHp3twHt0j+svzsP/lYoOPhVbtMyqTN
	EV0TJMnxjI5ZfIqjFjQAppIJo5LK9x35jamwt73brWhOS4sRrGMYk/Ig29n7pnOyWD2WUF8sl5s
	n4MYK0+emPugjAjWdMdmO2Fgrpu3/wJxqUJCjfpa1/0ru876TS+cokRg4PgLEqIpjtJGne60sNR
	IaqxgVUabEz8vgi94dwkpzpYmYDl64l9riO5OPNUDzMncJ7YT6giQ+b7fqDaVlaktGz6N8lfwBv
	4lvf2B4VzWdaBQQLh16mfanqyxXUEgx
X-Received: by 2002:a05:6000:491e:b0:481:44e5:160c with SMTP id ffacd0b85a97d-48159ed68f5mr9844185f8f.2.1786626983301;
        Thu, 13 Aug 2026 06:16:23 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2769sm6333494f8f.36.2026.08.13.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:16:22 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:16:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/18] tracing/remotes: Gate tracefs files opening on
 trace remote registration
Message-ID: <an3DosTQoNFcOHs4@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-2-vdonnefort@google.com>
 <20260812163111.587781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812163111.587781F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 04:31:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete tracefs gating: Caller-created tracefs files bypass the newly introduced `trace_remote_tracefs_open` gating, leaving them fully accessible if registration fails.
> --
> 
> --- Patch [1]: [PATCH v5 01/18] tracing/remotes: Gate tracefs files opening on trace remote registration ---
> commit 63ef30c302e1341f240b4f5b82d4e65d421da4cf
> Author: Vincent Donnefort <vdonnefort@google.com>
> tracing/remotes: Gate tracefs files opening on trace remote registration
> 
> This commit adds a global list of registered trace remotes and a gating
> function to prevent access to tracefs files for remotes that are being
> destroyed or failed to register. Standard trace remote file operations
> are wrapped to check this list before allowing open().
> 
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -932,8 +999,12 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
> >  	}
> >  
> >  	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
> > -	if (ret)
> > +	if (ret) {
> >  		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
> > +	} else {
> > +		guard(mutex)(&trace_remotes_lock);
> > +		list_add(&remote->node, &trace_remotes);
> > +	}
> >  
> >  	return ret;
> >  }
> 
> [Severity: High]
> Does this leave caller-created tracefs files exposed if cbs->init() fails?
> 
> If a remote's initialization fails halfway through, any custom tracefs files
> already created by cbs->init() will leak and remain accessible. Because
> trace_remote_tracefs_open() is static to trace_remote.c, the caller cannot
> wrap their custom files' open() callbacks with this new gating mechanism.
> 
> For example, if KVM's hyp_trace_init_tracefs() successfully creates
> a 'write_event' file but fails later, trace_remote_register() returns an
> error and the remote is not added to the trace_remotes list. 
> 
> Userspace could then open the leaked 'write_event' file, bypassing the
> gating entirely, and trigger kvm_call_hyp_nvhe() against the uninitialized
> hypervisor stub.
> 
> Should trace_remote_tracefs_open() be exported so that subsystems can gate
> their custom files, or should the leaked files be cleaned up when
> trace_remote_register() returns an error?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=1

In the following patch, the tracefs folder is entirely removed on init failure.

-- 
Vincent

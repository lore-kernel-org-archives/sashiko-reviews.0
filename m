Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF353E559A
	for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 23:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786922121; cv=none; b=YGUgbTAFd0xm8O4RUhEWVFOchEbB0Y5iPsMRVCCOWdMh+R1CMdXfIs4TJ62eh9+o0/9B4fMGbGcYihDrn8kmpGhOugTzP4LkD0RM5zWyZSVgqmtDWZlbxSGiRdjkZTIyWKqPF8WE9YkM/Bgo+Cv+mK0pCZgEhpm1lLNPzvqiGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786922121; c=relaxed/simple;
	bh=kZaryQEFDAwtcBmH075xLUIUtn8Z6aPjOOmfDN33OW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWWE5zjKsPjvDkO+p9O7Vf3TbiHTnVO8hkgA9Knka4qW2pFXFBsJYE4x2wI91q95uJ4Uk3BA3HgGpdDsRrPC3cqrLHY5bunIce+Za/OJ7QzMO+v4Ihv8owLJG62V/A+fRks+sSQmapw01OlzIbjV3jfb2NmMQR9De8Zn1W9oASQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=IsBkWl3l; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="IsBkWl3l"
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 8C63CA0614;
	Sun, 16 Aug 2026 23:15:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 0FA0720027;
	Sun, 16 Aug 2026 23:15:09 +0000 (UTC)
Date: Sun, 16 Aug 2026 19:15:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Hui Su" <sh_def@163.com>,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix crash passing ERR_PTR to kthread_stop()
Message-ID: <20260816191508.27f87c31@robin>
In-Reply-To: <20260815191034.82D8F1F000E9@smtp.kernel.org>
References: <20260815190151.568893-4-sh_def@163.com>
	<20260815191034.82D8F1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: a87cfc1c73p9zqz6eq1pu1oaj75m69aw
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 0FA0720027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18GMgLrU++4BAtKZ/brReYbAmD+Bk2V3ns=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=70peDjSv+s80yFEXxWa2RN38KLxDz6kSpijZWZdhg9U=; b=IsBkWl3lLtMJmmiZFomZT2s6fDW+tjBywjDRCJAcIogERzQ+UydCZ72Yp5PVfVPyYSB7FIxJmacKRWkKYkPRNLKRGICRvaEhBWHuN5yMYVmHEu2Mc2MVRdHysZRoNCphC8AcfBKZWe1kUaYucq6LGFWXgvXPincBxv1JDA+zhyc=
X-HE-Tag: 1786922109-717115
X-HE-Meta: U2FsdGVkX1+52xCGM+PhrG9cUFTwn+5ER6wRx6w5SrST0jQ5ODt9hLfdc0UeoUkLDkmtDIOgugt/9l72tyCXKFxtRinfFchuT3Hnk6OCMpr+zXLDZLCZNt7M8WBj5xsy+etPn2P1fp1xc00OXi46NKmLRHSXqRjNTEaAl0VtiI4RlZbcxoDB49+dTAaUGSx6Ysb/mLeiHNxdzFVoxPcdWgndH1J3djPd2j656jkwGoOfb4A+yeblu2PRhDNE0sd3mLKrAFmpno3xDZp+9XAagziBVBkKaA3gLuJQDfMZUwAVtgdy8XIHPrT9kbiaqQ4Y1jvX8s9wQLvlXwAQ+baBzSVrE5c6KQT9

On Sat, 15 Aug 2026 19:10:34 +0000
sashiko-bot@kernel.org wrote:

> > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> > index 0356cae0cf74e..207f47f54dbbf 100644
> > --- a/kernel/trace/trace_events.c
> > +++ b/kernel/trace/trace_events.c
> > @@ -3866,6 +3866,8 @@ static __init void event_test_stuff(void)
> >  	struct task_struct *test_thread;
> >  
> >  	test_thread = kthread_run(event_test_thread, NULL, "test-events");
> > +	if (IS_ERR(test_thread))
> > +		return;  
> 
> [Severity: Medium]
> Does returning silently here cause the self-test framework to falsely report
> success when the workload thread cannot be created?
> 
> The caller event_trace_self_tests() unconditionally prints "OK" after calling
> this function:
> 
> kernel/trace/trace_events.c:event_trace_self_tests() {
>         ...
> 		ftrace_event_enable_disable(file, 1);
> 		event_test_stuff();
> 		ftrace_event_enable_disable(file, 0);
> 
> 		pr_cont("OK\n");
> 	}
>         ...
> }
> 
> Should event_test_stuff() propagate the error so that the caller can correctly
> report the test failure or skip it appropriately?

Right, this is just a boot up test that is only done for debugging.
This is not something for production. If it fails, it should not fail
silently. If anything, it should be:

	if (WARN_ON(IS_ERR(test_thread))
		return;

-- Steve

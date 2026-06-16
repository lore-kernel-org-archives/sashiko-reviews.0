Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8E7439008
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619421; cv=none; b=NIzlHzMbWG9ifOZ38Yw3I+lvTj3h8XwqUQcypzYyOK2lEpqJBNE/0wO1LEVJZs8eAfNYUBHkrpaWnzccU51nS37Et2Vys0pFuHlt0ACOE1zTViSd6pEQIatQDRCKEGcBlh3V6lS6GqgSyZf5fCTH1eUpLpwfkNBqNtQ4ohODlS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619421; c=relaxed/simple;
	bh=tlDSEK976gz5kb/neTSe3xFsX12FQMD6y2dmDTdKLsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCdAoZF0q8rYYDkt56l/Kj/kpBqjFXDAk+F4WCL6mer5wAEzd/aKTDoIU/UdMZa6CFApcV17StdvcDjkUK16YHa58gj1P5QiivyCVl9fhvamZ3AKFxa7ZF/gnWUGgXdHmZqMVOX7he/e3M7C4JkBiYaDm9NtyuMrufiTjRZXF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g5y+Zkxj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g5y+Zkxj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E283612;
	Tue, 16 Jun 2026 07:16:55 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 742133F915;
	Tue, 16 Jun 2026 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781619419; bh=tlDSEK976gz5kb/neTSe3xFsX12FQMD6y2dmDTdKLsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5y+ZkxjsPWglGyZnrCceOrOxxjgRNz8E/fzoNUZ0OlrSQqewmpSb4W0Jenx8AYMq
	 Cags7kgBqKS8Mci+65etZ17fYkJzOcEDSRjpeCwjJUkfRGjNyq90LH+PtSWvrA+0UD
	 Tqm+H7DZKXFipfpHl9fkmlXHxksWlejCrr8n/x38=
Date: Tue, 16 Jun 2026 15:16:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v8 4/8] perf cs-etm: Use thread-stack for last branch
 entries
Message-ID: <20260616141656.GA31870@e132581.arm.com>
References: <20260611-b4-arm_cs_callchain_support_v1-v8-4-737948584fea@arm.com>
 <20260611171846.DC8031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611171846.DC8031F00893@smtp.kernel.org>

On Thu, Jun 11, 2026 at 05:18:46PM +0000, sashiko-bot@kernel.org wrote:

[...]

> > @@ -1644,8 +1593,11 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
> >  
> >  	cs_etm__copy_insn(etmq, tidq, packet, &sample);
> >  
> > -	if (etm->synth_opts.last_branch)
> > +	if (etm->synth_opts.last_branch) {
> > +		thread_stack__br_sample(tidq->frontend_thread, tidq->packet->cpu,
> > +					tidq->last_branch, tidq->br_stack_sz);
> 
> [Severity: Critical]
> This is a pre-existing issue, but calling thread_stack__br_sample() can
> trigger an out-of-bounds write in that function.
> 
> In thread_stack__br_sample(), when copying from the wrapped ring buffer, it
> calculates bounds using nr but ignores it in memcpy:
> 
> 	nr = min(ts->br_stack_pos, sz);
> 	memcpy(be, &src->entries[0], bsz * ts->br_stack_pos);
> 
> If the destination buffer size sz is smaller than ts->br_stack_pos, does the
> memcpy write beyond the allocated bounds for nr elements?

This is a common bug but irrelevant to this series. I will
use a separate patch set to address the issue.

> 
> >  		sample.branch_stack = tidq->last_branch;
> > +	}
> 
> [ ... ]
> 
> > @@ -2020,7 +1956,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
> >  
> >  	/* Reset last branches after flush the trace */
> >  	if (etm->synth_opts.last_branch)
> > -		cs_etm__reset_last_branch_rb(tidq);
> > +		thread_stack__flush(tidq->frontend_thread);

[...]

> [Severity: Medium]
> Looking at thread_stack__flush(), it clears the call stack but does not
> reset the branch stack array (ts->br_stack_pos and ts->br_stack_rb remain
> intact).
> 
> Will this leave stale branch entries from before a trace gap to be prepended
> to the new trace segment?

Seems it should clean up both ts->br_stack_pos and br_stack_rb->nr.
This will be addressed in separate series for fix common code.

Thanks,
Leo

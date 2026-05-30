Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B5030E0E9
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780152662; cv=none; b=G8lQI0OEjLmGtZxYpGKGvLDBLY+4veEmJOsDjerVzNeut128DXZlzoLeKdEgdu96x4ee55LrapcWD/8oRPopbY5dCBZG0HdJuzhood4UzF13QZR8R1Y0ynbs7JXz4FxawFJBLZ1wRiLwJK2bshQrQi4BktzjdCeOJ5+WPlLnUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780152662; c=relaxed/simple;
	bh=lM5J/uMQiS5qXjeCmLRb3DBjJ8vxE/goOuf6GyVt3pU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcd8+n2iiDhxaSe6O39dRL/2LZIqZ+LZPlI85Wefs+Eiwcmi+0UWYuU3w2dhpNDu6gFE2kIhTb/tt/zDLBRotpkCiUqMEulMCUMoPukqrW7J1rmAjVKBZDZN8p4ViSenHPhFKRPvnKirgMBTOUcQmfrdh6Z/pf9jCdQTPCfjecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 995CF1403B7;
	Sat, 30 May 2026 14:50:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id A158130;
	Sat, 30 May 2026 14:50:56 +0000 (UTC)
Date: Sat, 30 May 2026 10:51:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Crystal Wood <crwood@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Costa Shulyupin <costa.shul@redhat.com>,
 Wander Lairson Costa	 <wander@redhat.com>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] tracing/osnoise: Array printk init and cleanup
Message-ID: <20260530105135.7129cba7@gandalf.local.home>
In-Reply-To: <b555e6ba6f723c244edc88afbc6383022d51ed3c.camel@redhat.com>
References: <20260511223035.1475676-1-crwood@redhat.com>
	<20260520162810.3112a9d6@gandalf.local.home>
	<0c6606c49ab912904f00663f113289f546084925.camel@redhat.com>
	<b555e6ba6f723c244edc88afbc6383022d51ed3c.camel@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: A158130
X-Stat-Signature: 41rrmj7d5n39ncereygcyntdi55sp8ks
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19HSc+6PkLhRL2PnoDy7X204X1Qp6RCAMM=
X-HE-Tag: 1780152656-651639
X-HE-Meta: U2FsdGVkX1+StfGaZcqvN3jpv9tmBXlX+VNs+OpBs6HxLjwm7lNt2tjR4D4lagsst2ATHfMm8mydz5rwmWqSBqXZAOo4pViZbzfm5Y/a52T7u/zbXBvKlDFSK4NK6+3MJLR+rH5rRpq/Iz18Exag+3/Y563g2fIZQKiXIfLYRpM6eDDBeiS/TyOzbiFoA3Y3rSJvx8WAZWBGhCNwU3fao3erkP3l/WayYztADC7llbaRiK8CCGy036YHag7dPiCzLKTon9BB8iKahc+hzHRLt7xS0qKeP27VHwDJgUOq4ys++2SJ/qcXW8NGFGbF4kHDKGuH5oWeT5wlH9dun574KUsUxX2cmsRx

On Fri, 29 May 2026 22:33:37 -0500
Crystal Wood <crwood@redhat.com> wrote:
> > > diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
> > > index 75678053b21c..bda1e0e0d2e1 100644
> > > --- a/kernel/trace/trace_osnoise.c
> > > +++ b/kernel/trace/trace_osnoise.c
> > > @@ -476,8 +476,11 @@ static void print_osnoise_headers(struct seq_file *s)
> > >  										\
> > >  	rcu_read_lock();							\
> > >  	list_for_each_entry_rcu(inst, &osnoise_instances, list) {		\
> > > +		if (trace_array_get(inst->tr) < 0)				\
> > > +			continue;						\
> > >  		buffer = inst->tr->array_buffer.buffer;				\
> > >  		trace_array_printk_buf(buffer, _THIS_IP_, msg);			\
> > > +		trace_array_put(inst->tr);					\
> > >  	}									\
> > >  	rcu_read_unlock();							\
> > >  	osnoise_data.tainted = true;						\  
> > 
> > OK, I'll prepare a v3.  
> 
> Many osnoise_taint() callers, as well as timerlat_dump_stack(), can have
> preemption disabled, so the mutex in trace_array_get() won't work.

Right. OK, so another solution is to simply call synchronize_rcu() instead
of the kvfree_rcu_mightsleep(inst);

	synchronize_rcu();
	kvfree(inst);

Then there should not be any race, because the rmdir will have to wait for
the synchronization before finishing. This isn't something people should be
running a lot of, so I don't think it would cause too much pain in waiting
to unregister the osnoise tracer.

-- Steve

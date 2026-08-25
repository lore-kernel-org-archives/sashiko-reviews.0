Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C907468C13
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667703; cv=none; b=naV3pUDOLq097tYeA5dIfiddTyu7WG+dWpmSXtqCUFbUXQ/GkKZreIroj/2cbM7IRMiLoAGCOYkc/mfGnWHJW9GXrtXn7RLcVnT4mGlNlJ38AS/3582xCZTYOmnxFNvZVbN5b77W6Y88v1bCVxxuLIfOi6E9zsLyJH80GpisgH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667703; c=relaxed/simple;
	bh=qVOQf/4Bum1ObQleiOx+Ui66vjAbhU64jgUQFegbuP4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umuhN2IGBPJHq/hPvaCb55nXHZxhjP981YQXqVr4ku1bSAzZEhVk0t5w5B1uH3nJyR1IjjoAWfHNoZWPRF6dVJR+5iu0e2/z7qY7r7yCi5c2xmLa6JT+FGv7ZV17IXN383NpEwy3jgX+JlXompNmwz75y4lm/uvubkjrgbXCOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=3o1SW/xU; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="3o1SW/xU"
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 2DD11160419;
	Tue, 25 Aug 2026 14:21:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 82A6A20028;
	Tue, 25 Aug 2026 14:21:38 +0000 (UTC)
Date: Tue, 25 Aug 2026 10:22:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Henry Martin"
 <bsdhenrymartin@gmail.com>, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3] tracing/probes: Fix use-after-free on field
 name/type of multi-probe events
Message-ID: <20260825102221.79713c98@gandalf.local.home>
In-Reply-To: <20260825113714.188131F000E9@smtp.kernel.org>
References: <20260824144356.1f61aea2@gandalf.local.home>
	<20260825111210.3271443-1-bsdhenrymartin@gmail.com>
	<20260825113714.188131F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 82A6A20028
X-Stat-Signature: zgj8dw1tc13j54is5ugnmirmarfen171
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1936Yt/4Mafe4pBEQrflTH68trX21oNn74=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=u+CpOy2nA0bqzdCt9bf2x2Pk6p1WuhEBTEpLyYm/RWs=; b=3o1SW/xUBZOW9kLMVHEZ5in4wY/82pN9ufFOM1uQTPYZoM9xVxlq8fxdoyatUz0s/L+ENrsuENHM0FE3soBcQ6Tv6EP/SNL5jEtG1dhCDyBK1yl5olN5SCE8v7N8KJhe3MA2L1WjlXo0A466mekykF5c6NzaLmyo2lmCxgfHRdo=
X-HE-Tag: 1787667698-93265
X-HE-Meta: U2FsdGVkX1+pHOTAio9+MZXc4LyLIaWQAQyxGGIi196DOaRTtgEB/4mrbhlnhdWKHPBF5/DEdBI0P3G+aqd4VTUVm97AB3+A8nATGTxBTiPa4ilCOBCo5CbB5iJk2riNS1RHJEQcOAUccB5LSdIp4GaWXXCNG/kvq9mk/pmyBRo0QLhKM30aJhvpplZeJs3u3JJ5IQw/Kp1WV5JVM3MrR6Oc4I+RneduoKUpmkDBxRNybk8w1ZuI5fN4tMtoSjQgh32VEoYGR9uo6vNCtdASPJZThEQUe5dWAXOatMTECFNYwxaDTJTPG9uyMQN0YF7ielE3vrppDhYTLAoD7qHVPViUV+8aoI3+

On Tue, 25 Aug 2026 11:37:13 +0000
sashiko-bot@kernel.org wrote:

> > diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
> > index 36dff277de464..3057d31c57376 100644
> > --- a/kernel/trace/trace_probe.c
> > +++ b/kernel/trace/trace_probe.c
> > @@ -965,19 +965,48 @@ int traceprobe_set_print_fmt(struct trace_probe *tp, enum probe_print_type ptype
> >  int traceprobe_define_arg_fields(struct trace_event_call *event_call,
> >  				 size_t offset, struct trace_probe *tp)
> >  {
> > +	struct trace_probe_event *tpe = trace_probe_event_from_call(event_call);
> >  	int ret, i;
> >  
> > +	/*
> > +	 * A field created by trace_define_field() only stores the name and
> > +	 * type pointers, it does not copy the strings. Here they point into
> > +	 * the probe_arg of @tp, which is freed when @tp is removed. For a
> > +	 * multi-probe event the field list is defined once by the first probe
> > +	 * but kept alive by the surviving siblings, so removing that first
> > +	 * probe would leave the fields referencing freed memory. Make the
> > +	 * event own duplicates that live as long as the event call itself.
> > +	 */
> > +	if (tp->nr_args) {
> > +		tpe->field_strings = kcalloc(tp->nr_args * 2, sizeof(char *),
> > +					     GFP_KERNEL);
> > +		if (!tpe->field_strings)
> > +			return -ENOMEM;
> > +	}
> > +
> >  	/* Set argument names as fields */
> >  	for (i = 0; i < tp->nr_args; i++) {
> >  		struct probe_arg *parg = &tp->args[i];
> >  		const char *fmt = parg->type->fmttype;
> >  		int size = parg->type->size;
> > +		char *name, *type;
> >  
> >  		if (parg->fmt)
> >  			fmt = parg->fmt;
> >  		if (parg->count)
> >  			size *= parg->count;
> > -		ret = trace_define_field(event_call, fmt, parg->name,
> > +
> > +		name = kstrdup(parg->name, GFP_KERNEL);
> > +		type = kstrdup(fmt, GFP_KERNEL);
> > +		if (!name || !type) {
> > +			kfree(name);
> > +			kfree(type);
> > +			return -ENOMEM;
> > +		}
> > +		tpe->field_strings[tpe->nr_field_strings++] = name;
> > +		tpe->field_strings[tpe->nr_field_strings++] = type;
> > +
> > +		ret = trace_define_field(event_call, type, name,
> >  					 offset + parg->offset, size,
> >  					 parg->type->is_signed,
> >  					 FILTER_OTHER);
> > +		if (ret)
> > +			return ret;  
> 
> [Severity: High]
> If trace_define_field() fails, does this error path leak the newly allocated
> strings and the tpe->field_strings array?
> 
> Looking at event_define_fields() in kernel/trace/trace_events.c, the return
> value from this function is ignored:
> 
>     if (field->type == TRACE_FUNCTION_TYPE) {
>         field->define_fields(call);
>         break;
>     }
> 
> Since the return value is ignored and the event's field list remains empty
> if the first argument fails, couldn't the system invoke this function again 
> on retry if there are multiple trace array instances?
> 
> If it is retried, the initial kcalloc() unconditionally overwrites 
> tpe->field_strings, leaking the old array.
> 
> Additionally, since tpe->nr_field_strings is not reset on failure, wouldn't 
> a retry start appending string pointers out of bounds of the new array?  
> This appears like it could eventually cause trace_probe_event_free() to read 
> out-of-bounds pointers and pass them to kfree().
> 

The above looks legit too. Please address it.

-- Steve


> >  	}
> >  	return 0;
> >  }  
> 


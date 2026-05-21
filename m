Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A6218050
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779407332; cv=none; b=I1ijN5VneDSDlrtxIeDOvEBFFcQkzFpWzdSgE6MuLgxif+IDQnU6L3cWN8rNCzypqtK+txUVJUWx2FT96gnFlwc3on1ru+UwA1RAs8/3354JtvE/pb4B/G8Nyv8oWnY9cRTJsecQPicbAOmdd31kBDZB1M9RExFIc9VciKC0JqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779407332; c=relaxed/simple;
	bh=EaY1vV68VobVf2ItM/llNt7Lon15UzQ6ByYx/LmMwNg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUvYQx8T5njCNNu/pfF6yyrA4JYOM5qRCAPp5HN+dViqXCptBKCR5OBQhtkGyU51iMqiftgwjJ4+CJ2nIwCayZIwzMrYmbEvaH0sFFziIk4Vpd6f70c4AJb9sMbi1f/Vpkmp1W2PxIIbUjs/l8kdsuNZ8I8U23BwJs6qWINZ0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V93EnmFE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V93EnmFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779407323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8cJdETtqckVbOAFOQNlRpjMEoy2KAMuDd8RLGgp2wc=;
	b=V93EnmFE/0y0eBC7JYRTe9aAjr4XtkBoARURU1ziUyYmtcnoi1W2mucykWZi1nBQ7frqUh
	l10CJr0GWx6H0jmTvYCCPqpanwO/fmRvMyxMTxwpGghchhL8CsOaYtIb3jVyyIoYtnIeIv
	rpAuN1d9nqN7bzcbMU4Ork39eAOlALk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-G3IJzDnAP7yBrIpB3Fa4cA-1; Thu, 21 May 2026 19:48:41 -0400
X-MC-Unique: G3IJzDnAP7yBrIpB3Fa4cA-1
X-Mimecast-MFC-AGG-ID: G3IJzDnAP7yBrIpB3Fa4cA_1779407321
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914a8522bd2so276063785a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 16:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779407321; x=1780012121;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt4vn/YPrdmVNLXRtgxHHbPT36tdnBWP5ruICQlDgsY=;
        b=c+BxsmeS92PshnafgCvWP+gt1SMRQVTX/T55gyQ7tWTQ/Ay7hCP7ei/WC0UOjCj+vy
         f3KHHVdy8OCU1GLr8HiPJpYECAZydCYhMa030ruzVQ4/hgcr3zsf0kMLW/oR/u6M4/UQ
         cVEbrA5B6yhHi04MhVsF7+0SzkLuwBZiXA9IttQJGQfRjPv4rYpZ9oNlheDfW9MuNSB/
         5t7xmssxikNZUanR0+3P5XJ3ETXn+WpgogeN970nal+h+SEpYgZXwYIb3mx5VrLn8IVZ
         RmHrXdVmsEh74DgNTFugGt8mpP/vxqMAIip3AMsVZHJNVgMHizcxLqQFWFswxVMhb3Ip
         /PDw==
X-Forwarded-Encrypted: i=1; AFNElJ8ANbXKc3PDFUAQXHIzkyG4rmxpaCZhaIZNvCyVXCUYB9HcuAGEZUW6GXjZfemD7fbTNvFkSpu+9erSSO2J38s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTvHcjm3bLuceak1xxKg0wNjwQA5Rn3YX95toTmxLB9TdG8rJW
	gaBe6N85yXKv2XW00sDgakpM/NKkHytYFu4f2mez47aSi3kRJVcG112Iua1OEM4DUGOW1SytZ2u
	5hcyXjZFGZ/agEsXZCRb/gViBmaXOllsVvRYhf7BbFr0J9vFYrOrQjw1h7o0xlsS4/aifHA==
X-Gm-Gg: Acq92OHpL3jllvI1G8j7U8742Z9D4eTc4r3Y0SbL1IYO6788eyCE1iTjy1xIAU7HThI
	IWLYFQo7QQMKId4z6uM05TO4OnsHnL2KUlFv0hjixnQu/n+nvDRNtWZ8Wz33QiYaILblC62eZ0w
	GXPHwnAmGEdCNrb3n86hrnoDpj8bOe+N7MXZQlmpZYinOyGIFTSjPzmaQGDIInVonuWTGeLKeJZ
	n42Tb4fHE6ged5aHdTfu7fpMO76c4Y+ipRvJfObIIcJcTsWpcRVKtv45gJTW6Rtx0ctXuRDYBHk
	wFrseOVY/uw+woUtg9G36fdAP2j0sXaDvTfJlmPy7hD5BS4M1f25IokhfpIWKL05b1+f9fdfFNE
	3Gu1JOibfWxr9nvt149prLn3lnY1QiGOKDBCMFh7SgcIkHVy2xYu8jk0rOZkyvNY/
X-Received: by 2002:a05:620a:462c:b0:910:f8b4:8614 with SMTP id af79cd13be357-914b51668bdmr150679985a.31.1779407321150;
        Thu, 21 May 2026 16:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:910:f8b4:8614 with SMTP id af79cd13be357-914b51668bdmr150677585a.31.1779407320723;
        Thu, 21 May 2026 16:48:40 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb ([2601:447:cc81:56d0:ab94:b2cb:29a6:7ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914b5ffb74fsm40342485a.31.2026.05.21.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:48:40 -0700 (PDT)
Message-ID: <0c6606c49ab912904f00663f113289f546084925.camel@redhat.com>
Subject: Re: [PATCH v2] tracing/osnoise: Array printk init and cleanup
From: Crystal Wood <crwood@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>, 
 Tomas Glozar <tglozar@redhat.com>, Costa Shulyupin <costa.shul@redhat.com>,
 Wander Lairson Costa	 <wander@redhat.com>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev
Date: Thu, 21 May 2026 18:48:39 -0500
In-Reply-To: <20260520162810.3112a9d6@gandalf.local.home>
References: <20260511223035.1475676-1-crwood@redhat.com>
	 <20260520162810.3112a9d6@gandalf.local.home>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VWZl8l-Dp3oS-6uFi5BHr8vCW4W4bCiTB_LKxCCK0Pk_1779407321
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-05-20 at 16:28 -0400, Steven Rostedt wrote:
> [ Replying to Sashiko: https://sashiko.dev/?list=3Dorg.kernel.vger.linux-=
trace-kernel#/patchset/20260511223035.1475676-1-crwood%40redhat.com ]
>=20
> > commit 859dc1eded9e36304f27e72643f28f30f327f078
> > Author: Crystal Wood <crwood@redhat.com>
> > tracing/osnoise: Array printk init and cleanup
> > This commit initializes the trace array buffer for osnoise instances on
> > creation. It also introduces the osnoise_print() helper function and sw=
itches
> > the tracer to use trace_array_printk() instead of trace_array_printk_bu=
f().
> > > Use trace_array_printk() instead of trace_array_printk_buf(), as we'r=
e
> > > only writing to the main buffer (of a non-main instance) anyway -- an=
d
>=20
> > Is this description accurate? Can the osnoise tracer also be enabled on=
 the
> > global trace array, for example by writing to current_tracer?
> > If it is used on the global instance, trace_array_init_printk() explici=
tly
> > returns -EINVAL and refuses to allocate a buffer, and trace_array_print=
k()
> > will return 0 without printing.
>=20
> Hmm, I guess it would drop any of these prints if it's using the top leve=
l
> trace array. But I believe this is for use with RTLA which always creates=
 a
> trace instance.

It doesn't *have* to be used with rtla, but you won't get the printks if
you use the main instance.  The parenthetical was just meant to avoid
potential misunderstanding of the phrase "main buffer".

> > > diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnois=
e.c
> > > index 75678053b21c5..2be188768ab42 100644
> > > --- a/kernel/trace/trace_osnoise.c
> > > +++ b/kernel/trace/trace_osnoise.c
> > > @@ -83,6 +83,22 @@ struct osnoise_instance {
> > > =20
> > >  static struct list_head osnoise_instances;
> > > =20
> > > +static void osnoise_print(const char *fmt, ...)
> > > +{
> > > +=09struct osnoise_instance *inst;
> > > +=09struct trace_array *tr;
> > > +=09va_list ap;
> > > +
> > > +=09rcu_read_lock();
> > > +=09list_for_each_entry_rcu(inst, &osnoise_instances, list) {
> > > +=09=09tr =3D inst->tr;
> > > +=09=09va_start(ap, fmt);
> > > +=09=09trace_array_vprintk(tr, _RET_IP_, fmt, ap);
>=20
> > Does this code create a use-after-free on the trace array if an instanc=
e is
> > removed concurrently?

If so, it was already an issue with osnoise_taint(),
osnoise_stop_tracing(), osnoise_stop_exception(), etc.  Wouldn't be
surprising, as this file has a number of other synchronization issues as
well.

> > When a user deletes a trace instance via rmdir, the unregister function
> > removes the instance from the list using list_del_rcu(). However, the r=
emoval
> > routine does not appear to wait for an RCU grace period before freeing =
the
> > trace array itself.
> > Could a concurrent execution of this loop inside the rcu_read_lock() se=
ction
> > still access the unlinked instance, read the freed inst->tr, and pass i=
t to
> > trace_array_vprintk()? This appears to be an existing issue, but it sti=
ll
> > affects the loop here.
>=20
> Hmm, this is interesting. osnoise keeps track of its own instances via a
> osnoise_instances list. But it only use kfree_rcu() to free the list
> descriptor but doesn't take care of the tr being freed before hand!
>=20
> Something like this could work [not even compiled]
>=20
> diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
> index 75678053b21c..bda1e0e0d2e1 100644
> --- a/kernel/trace/trace_osnoise.c
> +++ b/kernel/trace/trace_osnoise.c
> @@ -476,8 +476,11 @@ static void print_osnoise_headers(struct seq_file *s=
)
>  =09=09=09=09=09=09=09=09=09=09\
>  =09rcu_read_lock();=09=09=09=09=09=09=09\
>  =09list_for_each_entry_rcu(inst, &osnoise_instances, list) {=09=09\
> +=09=09if (trace_array_get(inst->tr) < 0)=09=09=09=09\
> +=09=09=09continue;=09=09=09=09=09=09\
>  =09=09buffer =3D inst->tr->array_buffer.buffer;=09=09=09=09\
>  =09=09trace_array_printk_buf(buffer, _THIS_IP_, msg);=09=09=09\
> +=09=09trace_array_put(inst->tr);=09=09=09=09=09\
>  =09}=09=09=09=09=09=09=09=09=09\
>  =09rcu_read_unlock();=09=09=09=09=09=09=09\
>  =09osnoise_data.tainted =3D true;=09=09=09=09=09=09\

OK, I'll prepare a v3.

> > > @@ -1189,10 +1198,10 @@ static __always_inline void osnoise_stop_exce=
ption(char *msg, int cpu)
> > >  =09rcu_read_lock();
> > >  =09list_for_each_entry_rcu(inst, &osnoise_instances, list) {
> > >  =09=09tr =3D inst->tr;
> > > -=09=09trace_array_printk_buf(tr->array_buffer.buffer, _THIS_IP_,
> > > -=09=09=09=09       "stop tracing hit on cpu %d due to exception: %s\=
n",
> > > -=09=09=09=09       smp_processor_id(),
> > > -=09=09=09=09       msg);
> > > +=09=09trace_array_printk(tr, _THIS_IP_,
> > > +=09=09=09=09   "stop tracing hit on cpu %d due to exception: %s\n",
> > > +=09=09=09=09   smp_processor_id(),
> > > +=09=09=09=09   msg);
>=20
> > Does this switch to trace_array_printk() silently drop messages when tr=
acing
> > on the global instance?
> > Looking at trace_array_printk(), it explicitly returns 0 if the
> > TRACE_ARRAY_FL_GLOBAL flag is set on the trace array:
> > kernel/trace/trace_printk.c:trace_array_printk() {
> >     ...
> > =09if (tr->flags & TRACE_ARRAY_FL_GLOBAL)
> > =09=09return 0;
> >     ...
> > }
> > This means stop and exception logs would be discarded if the tracer is
> > running on the global instance.
>=20
> Yep. But maybe that's not an issue?

I'd actually consider it a fix, if the policy is actually about not
allowing tracers to "spam" the main instance, rather than just avoiding
the percpu allocation.  Especially for osnoise_stop_exception(), which
is called only one place, that already printed the same message with
osnoise_taint(). :-P

As I mentioned in the v1 patch, if trace_array_printk_buf() is going to
bypass the global instance check, should probably be internal to the
core trace code.

-Crystal


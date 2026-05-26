Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84B36F41C
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809898; cv=none; b=rN9HQQGTu+2DqJ7ZffFKnsDGG3JZO+DoDg3Zg7ZhaBEOss0pFDCj0/7uxeP3L0QRkrzBVnGRCrH3IpNGm0WYknLvW+eORtr+VyH2WVcIUuF8HaDISQS1je0Tq75ApYfEOfi4KfXYqs//rr81vxb+KcKFOrgFDnQtDHOhQq5MSf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809898; c=relaxed/simple;
	bh=cb9PY9vfujWozIcaypd3KYKty3U8tiNub/pncDPJnUE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKrjfbZ2J+TEh+Pdf+TPA1S/guqaapSk0gdDogd8vWXi4UTyuYEuf9IT8Rln7+BUv+x21UuKQ8BlmGRMu+WbZwaYyJDl7yhzPt6fZbEsRqZuA8Z/MAWIY6Q9Uc5GqSw7RCsDR6oPUHYaQjxJdtLE9NBY+IOsTzjmmfLj77YP8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id CD75B1C0310;
	Tue, 26 May 2026 15:38:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id E05DF20013;
	Tue, 26 May 2026 15:38:05 +0000 (UTC)
Date: Tue, 26 May 2026 11:38:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kernel-team@meta.com,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] perf/ftrace: Fix WARNING in
 __unregister_ftrace_function
Message-ID: <20260526113838.201f0718@gandalf.local.home>
In-Reply-To: <20260525143947.ea1c0a7b29146d22faa5feda@kernel.org>
References: <20260513161916.04151502@fangorn>
	<20260520164117.528d02fd@gandalf.local.home>
	<8f8d0cd380f40b84557304d110f38ecefc994a35.camel@surriel.com>
	<20260525143947.ea1c0a7b29146d22faa5feda@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E05DF20013
X-Stat-Signature: 5w1cm16541ip4hsaohjnpu7fahsawt8o
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/IlILSmfUeuUfvrRucnP1t+i8CVrKfzBo=
X-HE-Tag: 1779809885-114240
X-HE-Meta: U2FsdGVkX1/A7bbUni9eF4dJUx1Dn4esZwBw0RlgPG0I2RKiO4svEcSyJ+7tAPSXMqauGJEgoYi0Nm1BPuRbr92ac3dGR0DXY6Vg+SA5hWaNQS5nHoQ5ywGt8sfO5+ttvX3kkyu1eSbFcOgHtOl3DYJzgfl+spN3tduYqMQiUV2WYu1xe8GDyPdwGZFh3U4TaxSVCTlVgK+vJDUUw5fPDtTLZrpl1/mNyC7SirfCLDfrmIZPF4Vgeeb2dm5mu4veqNBPO16jIqyjagjV8FM/pT4dbrdvgofCTxjMvN9pV2qSCITBvwg6FBCfkKq6Ik3yqUndiSzGXEPlG+eukrFDwc+Ouez6a0zfwrzSKmJmeyqwm/SHUyZcFqtmNosOe9Lsvn317fdd51yYqh4se/N34Q==

On Mon, 25 May 2026 14:39:47 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > The error handling there all seems to "goto err_destroy"
> > 
> > err_destroy:
> >         if (event->destroy) {
> >                 event->destroy(event);
> >                 event->destroy = NULL;
> >         }
> > 
> >   
> > > > However, it does not set event->destroy to NULL.  
> > 
> > ... but it does?
> > 
> > I am not sure what code Sashiko is looking at,
> > but it does not look like the code I just pulled.  
> 
> Indeed.
> 
> > 
> > Is there a different tree I should be looking at
> > than upstream Linus?  
> 
> You can see the baseline info if you expand the collapsed triangle.
> Anyway, it said:
> 
> linux-trace/HEAD (70575e77839f4c5337ce2653b39b86bb365a870e)
> 
> So that is linux-trace/master.
> 
> commit 70575e77839f4c5337ce2653b39b86bb365a870e (linux-trace/master)
> Merge: 7bc6e90d7aa4 a43ae8057cc1
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Fri Sep 30 09:41:34 2022 -0700
> 
>     Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
> 
> 
> Hmm, this is too old. And linux-trace/master is not used anymore.


Hmm, I probably should delete that branch.

Thanks,

-- Steve

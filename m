Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D643A83BF
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723764; cv=none; b=UEH4iT786ggAmZOLsevaMHoEiap4W0F7W4IzhKsh6ZVwWO8uuUwvYp8U9DkSFy2gHpQc/e9fnQAsBJbW1BsPT9p52p5cWr4S9LQuy+LRj9bAbVQYwj0322i53hasoHRUdWs7bkpXoVO8I22LTDP4o4N/TvCu6VUBu2mKRlgZq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723764; c=relaxed/simple;
	bh=uIXp6ItDkFGo8F8Dis+92NlTOitMauccvrzKhGW+T9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/NKhd8hfUdaHeoqWF7PQ4XQ/oFDwbxwANkIfsJz55p+vSyx8ZhG9TrTANYGrVYuXC+R+rWXuLViivbV+/+dqHdZcOv8dDMsZmtPK+F27n6ABahknniQl4XBrXzIP+2QQUa0wWf1jACrzM1r+Cfo/PbFCXEv3CSn3P9OQDSt++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CdTdJ9mi; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CdTdJ9mi"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uIXp6ItDkFGo8F8Dis+92NlTOitMauccvrzKhGW+T9M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789723760; v=1; x=1790328560;
 b=CdTdJ9mieHa03nPMqyHpSvhoaji0deW664LodFQYZ4Mow2F4xHzf/qrO71mL4vLm1QNqcm8R
 JJgg9iZ9QFI3LZszY5AQnUbyWh5aCIPHMYhX+tEXZxvmkRhEoFARvxky2iBJZf/a9a3QCqfZiKv
 2+AiodGNS/RHLdeAjJ0U6Q5I=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 5f095623597664b9;
	Fri, 18 Sep 2026 09:29:20 +0000
X-Mizu-Trace-ID: 5f095623597664b9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 17:29:12 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/6] tools: ynl: convert enum selector to string
 for sub-message parsing
Message-ID: <aq0EaDMtiQehDGlt@fedora>
References: <20260917-ynl_rt_encap-v1-0-fbbe6e680571@kylinos.cn>
 <20260917-ynl_rt_encap-v1-2-fbbe6e680571@kylinos.cn>
 <20260918063657.4D10F1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918063657.4D10F1F00899@smtp.kernel.org>

On Fri, Sep 18, 2026 at 06:36:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ynl: NULL pointer dereference in generated sub-message parser
> --
> 
> commit fe174a522fe7b9577c0684fb882e6edfa773326f
> Author: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> tools: ynl: convert enum selector to string for sub-message parsing
>     
> YNL sub-message parsing expects a string selector for strcmp(). So for
> non-external enum selectors, convert the integer value to its string form
> via the family's {enum}_str() helper. This enables correct decoding of
> sub-messages keyed by enum values.
> 
> > diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
> > index 2b3483db1b60c..45bd7bc834b49 100755
> > --- a/tools/net/ynl/pyynl/ynl_gen_c.py
> > +++ b/tools/net/ynl/pyynl/ynl_gen_c.py
> > @@ -951,9 +951,17 @@ class TypeSubMessage(TypeNest):
> >              sel_var = f"_sel_{sel}"
> >          else:
> >              sel_var = f"{var}->{sel}"
> > +
> > +        parse_sel = sel_var
> > +        if not self.selector.is_external() and self.selector.attr and \
> > +           "enum" in self.selector.attr.attr:
> > +            enum_name = self.selector.attr.attr["enum"]
> > +            str_fn = c_lower(self.family.ident_name + "-" + enum_name) + "_str"
> > +            parse_sel = f"{str_fn}({sel_var})"
> > +
> >          get_lines = [f'if (!{sel_var})',
> >                       f'return ynl_submsg_failed(yarg, "{self.name}", "{selector}");',
> > -                     f"if ({self.nested_render_name}_parse(&parg, {sel_var}, attr))",
> > +                     f"if ({self.nested_render_name}_parse(&parg, {parse_sel}, attr))",
> 
> [Severity: High]
> Can this generated code cause a null pointer dereference in the user-space
> client when it communicates with a newer kernel?
> 
> The generated code checks if (!sel_var) first, which only catches a 0 value.
> However, if a non-zero unknown enum value is received, the auto-generated
> {enum}_str(sel_var) helper returns a null pointer.

Thanks, I will add a var to get the string first. And then check the new
parse_sel via 'if (!{parse_sel})'.

Hangbin

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B93EFFD5
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973861; cv=none; b=g3jAxh/yHqkSKyC6vJKRx82d1u+xMl7OD1UKUtqKykh9hFtgTCVdePVlGT8pdDFyi83QZo6iVU5GziToO/emMt10JAOSAhZ+Tql4XK+huos17W2pb528sPQATVCulckyYTGKtxdzR8j3IdyWWimtnhfbdzWbumaJyivCPNs+OCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973861; c=relaxed/simple;
	bh=hQU8bYLEzZMXVdr4+y4jMzcfO4VnymMpNENMq/A2lxI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaXwSImUN8ogx7HIcTonryBnilondn+X9Gj5Oke6VHDYjWzyoA//TmIE/TpJvp1fVLRxhB+1smcfWT9GsD3hIcZ/KX66wUImhiswKG+GwyQjk4EnHG8O1k1VsOzjCWdgrB04Sst4ZyvMMW3jGt3AwjjIDYTW/xk1k2f8qDBr2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEVAr2jI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEVAr2jI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49048e043e5so50783875e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779973858; x=1780578658; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VlSFzU4OA6IgOgRQsNEzlYK5GF7bePvTtFAZKCHC6lE=;
        b=GEVAr2jIzAFCDpqAe4n9dr2Zu5iZTYI8zoyDYxfuJ7Rwg8+OLxw4LXHgiG8UYHwX9z
         o5xAVfmQDJPSh8/qGO1Q1IE/Cx4/m6WAJNYnWLE9eyVSzzkhoVuedNIwsTMS4PfrQEEL
         AlSMdtfHP+xQ2OLHkSAtTfGAX9qUVIWsP/LsolHXQ14ab/ZBaXpARXCNSzt/wM+DefdU
         oCsrZQTKoOADH7I6k3DhzIevzrLSbBKuP9QSeArLml077ePPLSPw218OX3rlPfnyaobH
         h3x9kX+RVBFQL8KrDijQWQyCbuURaqSa0d+ngGESK8zbiZgqYYSbajoCLGVogwmZIJi5
         fOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973858; x=1780578658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlSFzU4OA6IgOgRQsNEzlYK5GF7bePvTtFAZKCHC6lE=;
        b=gu27pn+w0tbgMB/Joc576+0dpWjknO5u2zyr03ptUXcdB8+g1cfUOEhgswYKIOb3NA
         Fu1/KCDOeP4gBxMkoifW7j/3vk66IA+vSIRFMlgQ+pj7wEs07KfX/X28RwpA3S/c2Dre
         FNr25cwXivgLHGV79MEaXha3j/x0cHO3GN04zdlveRkXKcskZw72tiP87U2Ncr2U/Xxf
         TzrdDAQzN2noZ8/eofghutwZqhLIUsyZk2nW4Q4/E/5rkdYhq0KiK4X1pQ1fcDCiYx+K
         PIeTdLooh8sPbHxKLP6t+Y1kiVcTnqYZvXbP2DAxSliHJLvJ/Zd0uQPPe+rETpodskt1
         A1AQ==
X-Gm-Message-State: AOJu0YwmeNv07tB48RkeI8YkS5fibMnCqUw9ONzFt04KXULx6b4G0BaS
	L6PlBE/vLprXtVVN7eQMOrUCqt9YFsLD7OkdU77G1AZ8UfncaW/lcp1wdACCxQ==
X-Gm-Gg: Acq92OHAlH3B+i4XbXaP0QwBsoqzg1ntyfYAel8Vl3Sn04IggUIBTZEYYMgOqZtJDTN
	OoVBb07nka9PKUGFj/jZvNCA4QQGroWs7yxNFVBLdT9v9paLZyEnSkHoumPj+nu8+Bv7BWH2Z98
	+XLqTemSg5W/lLOUvOKrA6kemlRO1zkTksdzV6ZMw0V+q7RR5zA3tjGS3j/DKaKp4crACnOKuuv
	9CnJ2geBPrZqk4nXJee9sFoPh+OngZMCdtjeq2rWOj/S0b6DtzAB+IKXJGOht9tyrNApyx4ZLEa
	F6CMh6EW3+svsy082W0ywmeXcwnV9NJaNZf3HMhWuw9g2yv0IYLgeYPRsohEFCdswHtSN2cBKbM
	iWJjBnKSohNr9ruNSqg0NWz7yv4kV6Vc5taNCx+KoJPlGoENuIUJdFRD+00SfwaQw0eIHJdGmAb
	sGa4C0BajosxKvXDgqqbJd+CsuuXF2M3Qf14uj
X-Received: by 2002:a05:600c:45ce:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-49059cc9aa2mr314163815e9.4.1779973857960;
        Thu, 28 May 2026 06:10:57 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909236ad1fsm42985905e9.5.2026.05.28.06.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:10:57 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 28 May 2026 15:10:56 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv6 bpf-next 21/29] selftests/bpf: Add tracing multi
 skel/pattern/ids attach tests
Message-ID: <ahg-4LjsLyy8GqWo@krava>
References: <20260527113951.46265-22-jolsa@kernel.org>
 <20260527120154.9997E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527120154.9997E1F00A3A@smtp.kernel.org>

On Wed, May 27, 2026 at 12:01:53PM +0000, sashiko-bot@kernel.org wrote:

SNIP

> > +static __u32 *get_ids(const char * const funcs[], int funcs_cnt, const char *mod)
> > +{
> 
> [ ... ]
> 
> > +	ids = calloc(funcs_cnt, sizeof(ids[0]));
> > +	if (!ids)
> > +		goto out;
> > +
> > +	/*
> > +	 * We sort function names by name and search them
> > +	 * below for each function.
> > +	 */
> > +	for (i = 0; i < funcs_cnt; i++) {
> > +		if (!tsearch(&funcs[i], &root, compare)) {
> > +			ASSERT_FAIL("tsearch failed");
> > +			err = -1;
> > +			goto out;
> > +		}
> > +	}
> 
> [ ... ]
> 
> > +	if (err) {
> > +		free(ids);
> > +		ids = NULL;
> > +	}
> > +
> > +out:
> > +	tdestroy(root, tdestroy_free_nop);
> > +	btf__free(vmlinux_btf);
> > +	btf__free(btf);
> > +	return ids;
> > +}
> 
> [Severity: Medium]
> Does this error path leak the ids array and return an invalid pointer?
> 
> If tsearch() fails, the code sets err = -1 and jumps to the out label.
> However, the out label is placed after the if (err) cleanup block that is
> supposed to free ids and set it to NULL. 
> 
> Because the cleanup is bypassed, ids is leaked. Furthermore, the caller
> will receive a non-NULL pointer, which will incorrectly pass the
> ASSERT_OK_PTR check and cause the test to proceed using an array of zeros.

yep, it should land few lines above and do that err check, will fix

jirka

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260527113951.46265-22-jolsa@kernel.org?part=1

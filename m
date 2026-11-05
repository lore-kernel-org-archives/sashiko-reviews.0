Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.248.110.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913485;
	b=j6eMYyLBt5ZzyuhTHBf9pcnXwXN/fN6c2BIZScRCHbQ9t+DBFpIIVFnZRKE5zWIibTov
	 fwt1r21Yf84APpBzvCZ/Z77W9RJ3Gwu4Et5vXzoCEYAI+RN1DHIirUhwPY4sjeqq4szIq
	 rjJ80CnsBqse7pjWglRAmuC+JU4xm8+PBk5IOrGoOtyHzgffYa8+bNcD3pIrqKLTAKdoZ
	 trJkZwaM7pM9XxU+IyT3R1xPVMG2IAPc1gwNXXot4Jmj9/wfqx9yZ/QAyGDVFYREPVGQh
	 P5M3LV0S/z5+X84EIxRqfZERdqQ5+UyRprkZlhsn5I91M/iXFDca24PzdFlWUJFmzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913485;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1EYScnE0lKxRYwubxdcMCuFPTLuQa63CnwgA759Oz9I=;
	b=oy+/vtsJmOmmDNCyur7i4Uo7HVttrXH+GBjXY50uOnijSTxTkhL3A53o6ODwC56FKv3b
	 0YotntPXUrnv8ZzJMNwasYC6go4HuKH6kl7ynLwrj5my5LxU++uCQ4cXy+Y6fo7hqnuoy
	 iQSaNQtGe5sDi1uhHY3/WDaKZtuQ4YYXE0q9LgRNizqcNSVbjS4hO1v+p87ObfUyYE9Iv
	 tm74VBia2ccxgOt+3Qo5UueDU+9BgRbR69GzItO2TQB2VG2NReuvoDOWdaPVOJnfERHrX
	 O3KDL3jGVh5lxrC58ZiqY+NcLOIY/+F4M4z0w30HqT/iaZb83M/y7V2LhpCWrUm94CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aol.com;
	spf=pass smtp.mailfrom=aol.com;
	dkim=pass header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=QcZxjGvD;
	arc=none smtp.remote-ip=87.248.110.58
Received: from sonic307-33.consmr.mail.ir2.yahoo.com (sonic307-33.consmr.mail.ir2.yahoo.com [87.248.110.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08563606A329
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08563606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aol.com header.i=@aol.com header.a=rsa-sha256 header.s=a2048 header.b=QcZxjGvD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1793913483; bh=1EYScnE0lKxRYwubxdcMCuFPTLuQa63CnwgA759Oz9I=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=QcZxjGvDR+WY1NQk4F3WttqXxioF/Sx6Vb8TYW1/c6EfePV3JyK3xpDkaSSDmOQrACxWhQSowCY2mBsZMrPDJEqTf91KQ66nph2wU8FDnO6gd5552cCFONnVj6W5ma21TfpEDhgX5t9HYVZ66ecJqW4eoUxlfuN+f5zjN5CNDn6pHRyKdWWCRj8uqik2zOe+ToCFrc9IFopz06kNY1giKg6JUXq5pxLcQ2neSJspgyPVSOomV6AGAYJ6a4O4dugyJjr5vU3ICzgI79ZSfqLH128ytg1IvpwlSdKZ4Rkn5sr866FQgJXuT+CjSN942U5uxyTJaazm5blHZUI0Yijvvg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793913483; bh=HGz3t98R8qu0W5W40JKWQBJFVT90DzMlIuyBxJI7Tgo=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Qm0T81F3P4GmVfKnhb1dVBR+c9yi1YMvTxeDsAzePEaI6DzwlHvxWTvhNgFwmuPL7wrQVdcX/3leDaYPFot27Fj1VvxtrKntgV1AFG8MOCQAZ+Wj8Hf7/7HvBN4DMUCLUINKVApfC1Bv9P1Rz6C5cGyu2ukjI+FDR1A/zwNKIFKm6ao0zjlMnTWXXUQ2AFZEr+uvLWlnVapRNaMwpIrrPw1f+f5y8nwqr9edEuEJDxF2pgKRE8aCrqIV6+QLUGLDPMaRrI+guH3AzIKTAXP0kWYMws367h7jaypuNOUCit4TOHrGXtwscJ0bFf4PsEcLFaFKkLfCfaCnjRUhgsWIzw==
X-YMail-OSG: XzotGn4VM1md098.G2.j1U3e6PqJ7o0P2ztu27JlCkHOlDg5B1l50hXxcQ9Vm7g
 8lKSnE6peTFdRuvJPswPZDu257kREwavE37MsyFRbR5Qwfxvh1Q8BDoIs_n3.N8CvnbEiryJyyvz
 DochkbfZo549S2hFp3zfccwEr0Vi3vglTYugXgC.7hnnVo4aoBvmn7nZcJk1uBPkCs8SX1qKqeV_
 jDkb4I0zzMVyER3ixthI32zVIRSw7Xz.7uy9zAggzCrTicOtpPv6xkLUBq_RqkM9Rzyz4YT2qr.F
 YQ5uJyMpaJvVEYcBcbR8FYW.DqbdWniizrH_LTE40SZPMzTCxsshQhZie3Q4H9.zOyLp9_dI_fmU
 eYyfWwMLHY4VmOLE5AkgNyWrg0O0oPtW9kPcBjFKSmuCxvVhAJNYxOAEZMVyBjzldvBIYzYvbgEy
 aTUrIhH6uexLNgBdgFkYYmcgWZ160WofW3wh0rkV2UKdr3c9zComdXGLua_Lx9sWMzqzVONFPkMi
 I0jtzoul1Ikbwy3Oql6na0rvPz_jnNPoRNbvgftX3eF1LHvp5tZFEg9c323tKWZBBUZu9KGXa3Mv
 QKRPNGBa.mY5t2ivUWtdPEwnPNY9nbu8S8up.H73OSYvY6.c1iXgeUniItay9k6ONozmfupCAkll
 tkMCQexEbe2fOPivFAIyyMOGH2ajmcDjgls5o_0nURM1M1x._RdmQTTHDPnLddy_AM27bA.edVp2
 v3aC6iII8ph0wrOvYYWAZJtuVCBMvqiYPcc1rrZp1mq8TBQUou_rp.5R5FQTUNthJ8foT4OL3.Zc
 aTHtUU6de.Xm0mpoOxebT9RE.u4jYpcaEGB_iQBkyeAR_smN_7znGqiQ74O0YxN4Gfn7TMt37pId
 4u1Vhu12zcyrRD8pM9dF.UHQU2uMyvmLAlGwiRbtzOsqSIJmpiIUWq5hKytHpTNwqBfZQD807Pgg
 215Vy5g73ttwctWRNMEtMNe9oaGqBVz0TUbjgu4kWEuQUXNdUEfeONpgL8_rfJ.zcibrGK45kmbz
 KdJQJ9wc0WmLxa2awb6fzGy9Yc7NIAdWh6BH4gsBvakZASWmUG1Atxwq0uPzexElb_Exu140SeTO
 C7LtPGRUy6QDM1vZTyz95SYd1nD4qpxEBqHDGLE4y92bNeZxIJhL00NBxoQl5L.TPmPh1UYxkE1M
 R3R7N38H6G4_Ehqqy0sRTG0qqXUEhB7AFhlVbr3MsXfBujqvcMO4Dc.F_3LY5ILOXGkDJK6SxNdy
 Oa7UA6f1vPHWShOqvBPwHuPLk5sfBoe_GvGpgUVFbVyRxg2tgqPJe7rAbXHsRoVqSoXTBXa0nf.j
 RBai1l3ubBNomKQajsniDh12BPIDmPrW8j67Yx_lhkjUDvp6ME6DlI4Z1YidpffccTFldUnDS3lv
 yhILxdlujApBlvU8_jwIDr.2tTziorb6XpwDfyFDGnWm984ThzCi61c9q6Uemp_6SPvqN5_0SuDO
 GRqn9Zt.pzbFOpiwwSz6hz4eByOPgjqwgTdDZ6rPvAsPcDYfjmDmm0neEZViqZ54_PDP8SJA.7a1
 vs3.6QmCMabVk6uZ8gTgcpstRCoNEfhhV82FWBdOgdy9XSmRTyyCc9xuJLIOSetZmt0b0SYZ6jcZ
 BIGjOBzVtkgE706hgSeIrKQIekKMtigbr7_I_cGlu1KGYDtfCFp1C8RktIpOsjMKnmX3IImkWIhc
 wjE1XATIxj4AjBDFyl_A.FXlR1Miqcy5RjiIhpxqXU1ZZVcSlSQrU9Z1Qu0KIjH8dI7NPl6Zfng7
 Xhio0xaFzPlqImhURxAWBIPMEq5N4B02ooAgQNoPu8jlJoChiex1GTtsr5SXqTbqeyjdqKx6LxzP
 AJq5aeuznpM51AhSBxcUY3qv6YyfFZx77JBXyIFP5XY766OpzZtaXTNeDNe9ufWr13j6d1ujCpLS
 sgHxYGcH1pQ_kt66aC9eRy.Qrew1gQqSLBMpR7JIF0UIc0Z9B3P.y8cxLoGwZZjxZ8nKnKtox1Tm
 vICI8tdwNhus0TBK5tMx9hwXbiWLHG6nWHeMnq1y5mBRiwUuR88aikShE6HpnnCG7HCBMQsx7QGt
 FFQ5AmxrxE13SGv46aTBzlTU2oj2lEGPcTb38r8cuNB7N.4I0ffCThVOofpfrOY7v2_4niTGGLYb
 uqlg7TnwgNxzGhevVWDSB55F9ekH35nWC9YIv7lrZHhB4OPa1D1yp.93EbvrN2RCYyCmNItzRZ8M
 UCZ1ZtnRkKX7VND3tmhpP1P6J6L12qXtDyoynAG_j_BDb_YzBIAFyKgkE9paul3IEOLoyIZhY6a3
 UHkGcUaGN3o98xaUJDm7iuMyrElO1rcKGacZR1dE1_7EJ0ZImRulQ6g--
X-Sonic-MF: <jonathan.kuehn@aol.com>
X-Sonic-ID: 10b87929-41d6-46f4-8293-806fee5b5c87
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 5 Nov 2026 21:18:03 +0000
Received: by hermes--production-ir2-5dd9bf4598-p4sz7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 260db3b5d3f83d9c49ca8d388e9ce5f2;
          Thu, 05 Nov 2026 21:16:02 +0000 (UTC)
From: Jonathan Kuehn <jonathan.kuehn@aol.com>
To: sashiko-bot@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	jonathan.kuehn@aol.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] GPU: drm: nouveau: Prevent kernel oops on missing firmware binary
Date: Thu,  5 Nov 2026 22:15:55 +0100
Message-ID: <20261105211555.36218-1-jonathan.kuehn@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-200128@kernel.org>
References: <sashiko-outbox-200128@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>[Severity: Medium]
>Can a NULL gr pointer still reach nvkm_gr_units() here?
No, the oops was occuring on current debian kernel and I tested my patch
there as well.
For patching I used the drm-kernel-tree, but I forgot to check, 
if the check was performed previously in the call-trace.
Sorry.

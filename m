Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DA271443
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235111; cv=none; b=WKFvjJjDXscPRI/KvmBp5x312cX67nZ5rwGGCxdi3oNs1Z+9thAddwNDwGjvgMQUJ1WLW7Au4X6QGqUExOXT1T1+BkAqOUTmgNuD70QGekqnRs1fjJKX/u4585qoshRVkKrQLEpgnJiQpJcNYj0BElgF4jEu9dUrMm3By4ZpBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235111; c=relaxed/simple;
	bh=/FPeC+iW5UnCRy3xNOXJa0cp1E4xq5bXCrysjGn7FHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8CsA+TCsk9HVa6/rAtnbc7W8w6zyXMcCJ5CElozmRPcPBMln+DMn9R83EqKKMBA192Ox06VEpXjGeCINC6qBkSdIyeA2kwiph1TyBP1Az5W0ih+wu48Efy4T8EG0VhZPipw6SJxWdZvvoa43aPdh/f4gIvTJmPPXFVpTdM4H0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ttjs8lVS; arc=none smtp.client-ip=95.215.58.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ttjs8lVS"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/FPeC+iW5UnCRy3xNOXJa0cp1E4xq5bXCrysjGn7FHc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787235106; v=1; x=1787839906;
 b=ttjs8lVSb7FSNlW3WxBA2P/WWtaLl9tT8b2KYFY1As/NY586I19VO1kPE20J4wpqY+TMiVaV
 G9fHls6MHYQ/N5tqX6uGtsnxhlYj161taHmxg31lnqldA4F8+r5m24WUE15iLX0RZ20Xz2LqOaQ
 LPZnC1qOxKrfmqSBl48Wu6cs=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f41.google.com (209.85.167.41)
	by smtp.migadu.com with ESMTPS id 4f217f0037edbede;
	Thu, 20 Aug 2026 14:11:46 +0000
X-Mizu-Trace-ID: 4f217f0037edbede
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so11032e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 07:11:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxy6C/hS0JoV9q9CMVj73qCLAaiHD1WF+V9Ae/+GV6MWuF8/lSA
	n7Su+X+XRUyCxdWB0wPWMG7/G7SDsE/R9G/oImEnXbdent10aOpaGb7RosiLSeV0iFtmx674ns8
	WtpUmvrHAFQO8ckqUPd68YwpAhjA5fWh61PM/FOR4
X-Received: by 2002:a05:6512:3409:b0:5ae:a4e8:47be with SMTP id
 2adb3069b0e04-5b47dd9397cmr193818e87.7.1787235099874; Thu, 20 Aug 2026
 07:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820125053.2951078-1-fuad.tabba@linux.dev>
 <20260820125053.2951078-2-fuad.tabba@linux.dev> <20260820130616.1A7241F000E9@smtp.kernel.org>
In-Reply-To: <20260820130616.1A7241F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 20 Aug 2026 15:11:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzf4C6bdwTGWNN1HeapFWEFWm-AJtxi5gQKHekRS2n8Aw@mail.gmail.com>
X-Gm-Features: AcwNN1UO4jbfDArvCU_vsJPDoyO_q6tXOzTT6hgONE-IadCE9Lo9ihDN9V0SpyU
Message-ID: <CA+EHjTzf4C6bdwTGWNN1HeapFWEFWm-AJtxi5gQKHekRS2n8Aw@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/gic-v4: Clear the domain and fwnode pointers
 after freeing them
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh Sashiko, here we ago again...

On Thu, 20 Aug 2026 at 14:06, <sashiko-bot@kernel.org> wrote:
...
> [Severity: High]
> This is a pre-existing issue, but does this function permanently leak IRQ=
s
> and SGI domains?
>
> In arch/arm64/kvm/vgic/vgic-v4.c:vgic_v4_init(), KVM intentionally trunca=
tes
> dist->its_vm.nr_vpes upon failure to allocate VPE IRQs:
>
>     dist->its_vm.nr_vpes =3D i;
>
> This limits the teardown loop in vgic_v4_teardown(), which later calls
> its_free_vcpu_irqs() with the fatally truncated nr_vpes value.
>
> Because its_free_vcpu_irqs() relies on vm->nr_vpes to free the IRQ hierar=
chy
> and SGI domains originally allocated for all VCPUs, the truncation causes=
 a
> partial free.

Looks like a bug indeed...

I think the problem is that vgic_v4_init() overloads its_vm.nr_vpes:
it truncates the count to bound the free_irq() loop, but
its_free_vcpu_irqs() reads the same count and under-frees what
its_alloc_vcpu_irqs() allocated at and above the failure index.

The fix I have in mind keeps the two counts apart: teardown frees
everything allocated, and free_irq() only touches the requested
doorbells. Marc, what do you think? Something like this (not tested):

@@ vgic_v4_init(), on vgic_v4_request_vpe_irq() failure @@
                 ret =3D vgic_v4_request_vpe_irq(vcpu, irq);
                 if (ret) {
                         kvm_err("failed to allocate vcpu IRQ%d\n", irq);
-                        /*
-                         * Trick: adjust the number of vpes so we know
-                         * how many to nuke on teardown...
-                         */
-                        dist->its_vm.nr_vpes =3D i;
                         break;
                 }
         }

-        if (ret)
-                vgic_v4_teardown(kvm);
+        if (ret) {
+                /* Undo the doorbells we requested (0..i-1)... */
+                while (--i >=3D 0) {
+                        int db =3D dist->its_vm.vpes[i]->irq;
+                        irq_clear_status_flags(db, DB_IRQ_FLAGS);
+                        free_irq(db, kvm_get_vcpu(kvm, i));
+                }
+                /* ...but free everything its_alloc_vcpu_irqs() allocated.=
 */
+                its_free_vcpu_irqs(&dist->its_vm);
+                kfree(dist->its_vm.vpes);
+                dist->its_vm.nr_vpes =3D 0;
+                dist->its_vm.vpes =3D NULL;
+        }

         return ret;

The actual patch would factor the shared teardown tail into a helper
rather than duplicate it.

If you (Marc) agree, I'll send this as a separate patch (after testing
it), or as part of a possible respin in a couple of days.

Cheers,
/fuad




>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820125053.29=
51078-1-fuad.tabba@linux.dev?part=3D1

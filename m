Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541885;
	b=CgdGx2XpYWjy6cEeYZp4s7FcQCiIUVEKgqR7nYDiW3p1s9K1Px3gLPakK/dE2mGrBNXl
	 /HP0rppZbLwt7lanwKqW4fKfLreUEzhnoOXWFMUr4DBIHMBMQyDKmuf/2DCYjUyRiPBcd
	 bAaUW9G6Uy1HS6GUypDNPGS0OmfGNiGLq8XcxL035soJ8zG6U2ZqfNfQ+xOUAvSaLH4Fk
	 PJslMoL1d+I9u6MZOPMjyxvqb0rO1eOb6zRMYOw3Kfs6UjTPubmovZoI/NalA571Mtf56
	 erbVIcBBf5RLDFKVL+bXsYdu5T0P48h5YwtVGVXNxpqFkoB+ThnsO09Q7v3EPtrNQjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=27zYXXgABty8CUqGukpLM4c2xVBftF9tF/4zdE571W4=;
	b=pCAOuDRX+pJWzGSYxndnIqGyco6Fp3f8474dhvdAMTxpnxKVz8+Xa2qjgHQtggdv5AXj
	 EHY7NPCeYuDWlnXuYbFm0WgTES/6BOKlndoUAVMYm3J9UHbnyvArSwngsTYsW6up41fFp
	 rSHWwRg/6zyEwROLItLAwzNRlpz9jXp6mvQ8uJr75SHRFRZ43OsPau410tAOWIbPszaC0
	 OJWHsRgR2q++Haa5ZJBNZx4NoH2xzxyFglmJfCpgvIXl0xHtNa6aje/fTBA1l/48fMgG3
	 klbsAsV+iCNHuIuuycbnK24G+fLxR25VAIPHodl/tNVhjK+qMuPhzhjLNrI+e27HPDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nkXZh4Bb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989FB606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nkXZh4Bb
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5133831027so691429566b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541882; cv=none;
        d=google.com; s=arc-20260327;
        b=sKCq54vr4voOvnNTwa6hKDNbzLj3CpgZpQ/ie5/vXLIt6EyuekL1+2G0F7ts6MHbVF
         fgQijaEBTOlPTalIZpMh00dVpjLuTaGLk6NJ8QAGQf/DV1vBxOvyZ3yRZzU6qki/B7rd
         wolHhjF60U1AAMLlbUCC38QctPa7TbirVTiN7p8tTprixTXF7pmpD1Zh/m9YdLU9Xj1d
         OBtES7P6FJMWq2TErbqfsTGyWBUAS3GI9W3S5uBdp7rv9jhvkwEBS7jVqXWt7QoBHysa
         uTlOwz48Vm1D+AoVc+ft7sZir3juUmmy7c5dz2Ue9kwFzK4pWJXjIBVebiZsZBR207px
         H5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27zYXXgABty8CUqGukpLM4c2xVBftF9tF/4zdE571W4=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=nBUCqhbPBM+ydNomY55bYYVYrJQ6RTjsMW4cmrpFZ796moPD9I86zMi0pqQXRqT4WY
         Ymnf5tAuzUf4CPZOFhRv56oIGXSy6oX8w7kY7zl/meNaVhf1IV1jSyHQyZjoaYVlcQTl
         2f1eTmgV4pnQ1yaOCqRJeiqrb96patrU9XhoWU0EJaqju86GEAIO6P+XfVCbMMmI2VPi
         DqQsL/ANG1y8Qe7jmDSOJSjyR6d5whdI8+WHRqkWFCzIuw2thfzgGa0w4JTeg92A7ugq
         c2ojCVXgC7d27z57VXugTofYpezCIQbcxP+zXq0y6GMmx0nPuarewKRe5kNf1I8OwLWC
         j2og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541882; x=1796146682; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27zYXXgABty8CUqGukpLM4c2xVBftF9tF/4zdE571W4=;
        b=nkXZh4Bbk1I5qCbXylB8/55GBwNDkoPyT8NB0Lxbyi0UEGSFVnhSXVSKUnQok2BvSX
         NRlPxR4nHXu2U0LQwo4MXbrHLkz0nm8yQ0mEm3B2DmjbgzjyUTsxLni7EAtfDHOX+kGP
         guKWZgcyHTX5X3/EciM+h7/54sq9rgui6d/93CN5VKkX/SHbtpmHMWvvMcGzB8tjJIyj
         VA55N6mh3m1yFIhwXZP45YARnenIaF6JgfUXF4xEJIGldHZ2f8AKlzHC5WBMzvK2Zv6s
         26hHgVrw+2Md2IK/HjVvYlsIdECB6K2RgtuI8C6R82Q9JuVaUCuD5GJS1vpUowl4U7Yz
         oOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541882; x=1796146682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27zYXXgABty8CUqGukpLM4c2xVBftF9tF/4zdE571W4=;
        b=y9fC6ol/Xi6XXspQITCzNbQ0/jlr6IC8Vtnh0ygWhf6FVLICydyNdlIQTL67EOEGH0
         jI094QOPCN05Wgv16IkAf5T1746S3u/B7sG4egfZVzPA6Lgg+cRQw+vUiGvo7tOUERtE
         5BAmliwH9/1QVDRNjOwvWI/caY3C9DEbi5tA2is7cZJ/c790S3MMHPyR4K2ni5xiWBJS
         MmBBtmKC6W/actobiT2RP9fWmcW0mPzco55KHTEVHzeJZiObTb7Pw5RU5YTsrO7KgnQ6
         7G33u1xUVsBQC57Sr3yMHYEg0u3Zk81UJIZQRhRYuMs0UmRk2YyaoRhabCRoy+Xm6Yo+
         9A7Q==
X-Gm-Message-State: APuU4Z+oFDgM+dtbcoAll7+/R57m6YPu8xjCIL3ofGUpF2aFrx/TMKI2
	dX3FDKmGQUqmDExO4ndKV3rpGHfSAVyHlkmNdj+eOmDUb0kXN0Yo3o0dV0hpYW2MqS/BklKQNEg
	WxjaSTOG9VP5ghp1GW4ADVzIkvHYiQdn1uV8Q0ouJrCq9xROnfT6f91AGKJY=
X-Gm-Gg: AZFdTZdAr+VGATuwBEPm/tAbPFf9N/FoVlkSIogygJ5b2u8zpWa9yXsAjB+026fhTrB
	pWAGh8E3nSPnnm9XCANtiQNVW1to8b04u07GeROTJXWNY9f75aIvnXZQzX2fEIxbDFOPwOqfIzk
	3f0waoWnBmfs7nhZHi7zYbx9RAJRO3cJjHoygdurIU7ThPaOeMAiVMYTiTprt8kdAZD+rUwmvlB
	VIyUEW6+fZUC1L/0CAmQ2u1J9d8ia2NtlBtRl24OnakP2QqKwrp/bhoJbhATPBV6l4DFiLDFAGp
	CmiZqLpaVN78rNnQqxF5AjDe5IqI0zjx50JKzc/HsbJfbAsdvNri8nLQ23liIvwUNiJaB7SddEx
	6upIphl4dW/QjyiFZcq6DLgcI98tiWo4Ajw5s/a7IiK+us7Sp5GP09VwM/UaI3pXg0GKoOtDVcZ
	xml4gpgI7H00O04hSW3Jb2s3MH5ZqS4+KUi92plZrp3ISGI4ktJgCg9+EewV/kZ/J/gcTHgSiZ
X-Received: by 2002:a17:906:1b45:b0:c4c:f85f:aa2b with SMTP id
 a640c23a62f3a-c513a817fc7mr933423266b.24.1795541882037; Tue, 24 Nov 2026
 09:38:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-15-jthoughton@google.com> <sashiko-outbox-228643@kernel.org>
In-Reply-To: <sashiko-outbox-228643@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:37:25 -0500
X-Gm-Features: Aa3M54pJqG_uJJ6nSsmIk2hsh8SZo2wXqFjyOnO5jM3lVaei5N6Moc8ra8UgiVo
Message-ID: <CADrL8HUHT5aSwXHg2z4hFqn7gaKNFavKOzKW974T84BapHXYUg@mail.gmail.com>
Subject: Re: [PATCH v3 14/19] selftests/mm: Add HugeTLB vmemmap optimization
 stress test
To: sashiko-reviews@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] selftests/mm: offlined memory blocks not re-onlined in
>   stress_phase()
> - [Low] selftests/mm: unchecked mktemp failure in
>   hugetlb_vmemmap_stress.sh
> --
>
> commit 15090370906fbd4c082668bfc18a1ce3c873bcb2
> Author: James Houghton <jthoughton@google.com>
>
> selftests/mm: Add HugeTLB vmemmap optimization stress test
>
> This commit adds a kselftest script that stresses HugeTLB vmemmap
> optimization (HVO) across accounting, concurrent access, and fault-inject=
ion
> phases.
>
> > diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/too=
ls/testing/selftests/mm/hugetlb_vmemmap_stress.sh
> > new file mode 100755
> > index 0000000000000..b64fdb3ed7614
> > --- /dev/null
> > +++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
> [ ... ]
> > +orig_nr=3D$(cat "$hp_dir/nr_hugepages")
> > +target_nr=3D$(( orig_nr + nr ))
> > +marker=3D"hvo-stress-$$-$(date +%s)"
> > +tmpdir=3D$(mktemp -d)
> > +pids=3D()
>
> [Severity: Low]
> What happens if mktemp -d fails here?  Because only set -u is active,
> tmpdir becomes empty and hotplugger() appends to /hotplug in the root
> directory (which cleanup() does not remove).

I will fail the test if mktemp -d fails, thanks!

> [ ... ]
>
> > +hotplugger() {
> > +     local blk state removable
> > +
> > +     while :; do
> > +             for blk in /sys/devices/system/memory/memory*; do
> > +                     state=3D$(cat "$blk/state" 2>/dev/null)
> > +                     removable=3D$(cat "$blk/removable" 2>/dev/null ||=
 echo 1)
> > +                     [ "$state" =3D online ] || continue
> > +                     [ "$removable" =3D 1 ] || continue
> > +                     echo "$blk" >> "$tmpdir/hotplug"
> > +                     # A signal aborts a pending offline_pages(). Use
> > +                     # --foreground so that the writer stays in the wo=
rker's
> > +                     # process group and is killed by stop_workers().
> > +                     timeout --foreground 10 \
> > +                             sh -c "echo offline > $blk/state" 2>/dev/=
null
> > +                     echo online > "$blk/state" 2>/dev/null
> > +                     sleep 1
> > +             done
> > +     done
> > +}
> [ ... ]
> > +cleanup() {
> > +     local blk t
> > +
> > +     stop_workers
> > +     for t in fail_hugetlb_vmemmap_pte; do
> > +             [ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
> > +     done
> > +     if [ -f "$tmpdir/hotplug" ]; then
> > +             sort -u "$tmpdir/hotplug" | while read -r blk; do
> > +                     [ "$(cat "$blk/state")" =3D online ] ||
> > +                             echo online > "$blk/state" 2>/dev/null
> > +             done
> > +     fi
> > +     # drain() also frees free surplus pages left by failed restores.
> > +     drain > /dev/null
> > +     rm -rf "$tmpdir"
> > +}
> > +trap cleanup EXIT
> > +trap 'exit $KSFT_FAIL' INT TERM
> > +
> > +# Run a stress phase. $1: name, $2: fault attr to enable ("" for none)=
.
> > +stress_phase() {
> > +     local name=3D$1 fa=3D$2 base after injected
> > +
> > +     if [ -n "$fa" ] && [ ! -d "$(fa_dir "$fa")" ]; then
> > +             echo "SKIP: $name (no $(fa_dir "$fa"))"
> > +             return
> > +     fi
> > +
> > +     log "phase $name: ${duration}s"
> > +     base=3D$(memmap_total)
> > +     [ -n "$fa" ] && fa_enable "$fa"
> > +     start_workers
> > +     sleep "$duration"
> > +     stop_workers
> > +     if [ -n "$fa" ]; then
> > +             injected=3D$(fa_disable "$fa")
> > +             log "$name: injected $injected failures"
> > +             [ "$injected" -gt 0 ] ||
> > +                     log "WARNING: $name: no failures injected"
> > +     fi
> > +
> > +     drain || return
> > +     after=3D$(memmap_total)
> > +     if [ "$after" -ne "$base" ]; then
> > +             fail "$name: memmap pages $after after drain, expected $b=
ase"
> > +     else
> > +             pass "$name"
> > +     fi
> > +}
>
> [Severity: Medium]
> Should memory blocks recorded in $tmpdir/hotplug be re-onlined at the end
> of each stress_phase() (or in stop_workers()) rather than only in
> cleanup() on script exit?
>
> If SIGTERM from stop_workers() terminates hotplugger() after offlining a
> block and before "echo online > $blk/state" runs, that block stays offlin=
e
> during drain(), the post-phase memmap_total() check, and any subsequent
> phase.  When page_ext is active (such as with -o and -m together),
> offlining a block frees its section page_ext table and decrements
> nr_memmap_pages until the block is re-onlined:
>
> mm/page_ext.c:free_page_ext() {
>     ...
>         table_size =3D page_ext_size * PAGES_PER_SECTION;
>         memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
>     ...
> }
>
> As a result, stress_phase() reads a lower memmap_total() than base and
> reports a false accounting failure.

I will re-online the memory blocks after stop_workers() in each phase in v4=
.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122184453.26=
68189-1-jthoughton@google.com?part=3D14
